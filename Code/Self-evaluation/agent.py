# %%
import textworld
import textworld.gym

# %%
import time
import re
import os
from glob import glob
from typing import Mapping, Any

import random
random.seed("polietilene")
import math
import numpy as np

# %%
import torch

torch.set_default_device('cuda')
torch.cuda.device("cuda")
# torch.backends.cuda.matmul.allow_tf32 = True
# torch.set_float32_matmul_precision('high')
# %%
from transformers import AutoModelForCausalLM, AutoTokenizer

# %%
model_name = "Qwen/Qwen3-4B"

# load the tokenizer and the model
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(
    model_name,
    dtype="auto",
    device_map="auto"
)


# %% [markdown]
# ## Agents

# %%
class RandomAgent(textworld.gym.Agent):
    """ Agent that randomly selects a command from the admissible ones. """
    def __init__(self, seed=1234):
        self.seed = seed
        self.rng = np.random.RandomState(self.seed)

    @property
    def infos_to_request(self) -> textworld.EnvInfos:
        return textworld.EnvInfos(admissible_commands=True)

    def act(self, obs: str, score: int, done: bool, infos: Mapping[str, Any]) -> str:
        return self.rng.choice(infos["admissible_commands"])

# %%
class LLMAgent(textworld.gym.Agent):
    """LLM from HuggingFace that acts as an agent."""
    model = None
    tokenizer = None
    context = ""

    token_think = "/think"
    token_nothink = "/no_think"
    id_token_open_think = None # <think> . TODO find it
    id_token_close_think = 151668 # </think>
    token_system = "<|im_start|>system\n"
    token_endofturn = "<|im_end|>\n"
    token_user = "<|im_start|>user\n"
    token_assistant = "<|im_start|>assistant\n"
#     system_prompt = """
# You are an assistant playing a textual game.
# The user gives you information on the environment and you reply exclusively in the form \"verb noun\", like \"open box\" or \"take key\".
# /no_think
# """
#     system_prompt = """
# You are an assistant playing a textual game.
# The user gives you information on the environment and you reply with a short command, like \"take box\" or \"open chest with key\".
# /no_think
# """

    system_prompt = """
You are an assistant playing a textual game.
The user gives you information on the environment and you reply with a short command, like \"go north\". Only output the action, nothing else.
/no_think
"""

    first_move = False
    
    def __init__(self, model, tokenizer):
        self.model = model
        self.tokenizer = tokenizer
        self.initialize_context()

    def initialize_context(self):
        self.context = self.token_system + self.system_prompt + self.token_endofturn
        self.first_move = True

    @property
    def infos_to_request(self) -> textworld.EnvInfos:
        return textworld.EnvInfos(admissible_commands=True)

    def act(self, obs: str, score: int, done: bool, infos: Mapping[str, Any]) -> str:

        if done:
            self.initialize_context() # resets context
            return ":)"
            
        if self.first_move:
            self.first_move = False
            return "help"
        
        try:
            self.context += self.token_user + obs + self.token_endofturn
            self.context += self.token_assistant # induces model to generate answer
            
            input_ids = self.tokenizer.encode(
                self.context,
                return_tensors = "pt")
            
            generated_ids = self.model.generate(
                input_ids.to("cuda"),
                max_new_tokens = 100,
                eos_token_id = self.tokenizer.eos_token_id
                )
            output_ids = generated_ids[0][len(input_ids[0]):].tolist() 
            
            # parsing thinking content
            try:
                # index finding </think>
                index = len(output_ids) - output_ids[::-1].index(self.id_token_close_think)
            except ValueError:
                index = 0
            response = tokenizer.decode(output_ids[index:], skip_special_tokens=True).strip("\n")
            
            self.context += response + self.token_endofturn

            if len(response.split()) <= 10:
                command = response
            else: # more than 10 words, output is surely wrong
                command = "look"
            return command
            
        except KeyboardInterrupt:
            pass  # Try stopping the game prematurely.

# %%
class LLMAgentSelfEvaluate(LLMAgent):
    """LLM from HuggingFace that acts as an agent. It self-evaluates its status and moves."""

    selfeval_turn_counter = 0
    selfeval_turns = 5
    selfevaluated_last_turn = False
    random_selfeval = False
    handheld = True
    verbose = False
    reads_own_reasoning = False

    def __init__(self, model=model, tokenizer=tokenizer,
    selfeval_turns = 5, random_selfeval = False,
    verbose = False, log = False,
    handheld = False, reads_own_reasoning = False):
        """Initialization function.
        selfeval_turns: how many turns should pass between a self-evaluation and the next one.
        random_selfeval: whether the self-evaluation turn counter should be random. It's randomized within an interval centered on selfeval_turns, if that value is passed
        handheld: if this is set to True there are a few simple changes in the function that make it easier for the LLM to understand and correct its course
        reads_own_reasoning: if the model's reasoning during the self-evaluation turns should be included in the context too, or only its final action
        """
        super().__init__(model, tokenizer)

        if selfeval_turns == 0:
            selfeval_turns = -1 # actual default value for deactivating self-evaluation
        else:
            self.selfeval_turns = selfeval_turns
        self.random_selfeval = random_selfeval
        
        self.initialize_context()

        self.handheld = handheld
        self.verbose = verbose
        self.reads_own_reasoning = reads_own_reasoning

    def initialize_context(self):
        """A helper function for resetting the internal state of the model before starting a new game.
        """
        super().initialize_context()
        self.selfeval_turn_counter = 0
        if self.random_selfeval:
            self.randomize_selfeval_turn()
        self.selvaluated_last_turn = False

    def randomize_selfeval_turn(self):
        """This function randomizes the self-evaluation turn counter every time the model is
        (re-)initialized and every time it does a self-evaluation turn.
        """
        mean = self.selfeval_turns
        self.selfeval_turns = random.randint(math.floor(mean/2), math.ceil(mean + mean/2))

    def generate_response(self, think=False):
        if think:
            max_new_tokens = 20000 # allow reasoning models to be talkative
        else:
            max_new_tokens = 20 # reduce generation almost to a minimum
        
        input_ids = self.tokenizer.encode(
                self.context,
                return_tensors = "pt")
        try:
            generated_ids = self.model.generate(
                input_ids.to("cuda"),
                max_new_tokens = max_new_tokens,
                eos_token_id = self.tokenizer.eos_token_id
                )
            output_ids = generated_ids[0][len(input_ids[0]):].tolist()
        except:
            return "help" # model is in distress :)

        if len(output_ids) >= 0.9 * max_new_tokens: # reached or almost reached cap -- let's help the model a bit
            substitute_command = random.choice(["help", "look"])
            if think:
                return ("", substitute_command)
            else:
                return substitute_command
        
        try:
            # index finding </think>
            index = len(output_ids) - output_ids[::-1].index(self.id_token_close_think)
        except ValueError:
            index = 0
        if think:
            thinking_response = tokenizer.decode(output_ids[:index], skip_special_tokens=True) \
            .replace("/no_think", "") \
            .strip("\n") # cannot replace /think bc </think> contains it...
            response = tokenizer.decode(output_ids[(index):], skip_special_tokens=True) \
            .replace("<think>", "") \
            .replace("</think>", "") \
            .replace("/think", "") \
            .replace("/no_think", "") \
            .strip("\n")
            return (thinking_response, response)
        else:
            response = tokenizer.decode(output_ids[index:], skip_special_tokens=True) \
            .replace("<think>", "") \
            .replace("</think>", "") \
            .replace("/think", "") \
            .replace("/no_think", "") \
            .strip("\n")
            return response

    def act(self, obs: str, score: int, done: bool, infos: Mapping[str, Any]) -> str:
        if done:
            self.initialize_context() # resets context
            return ":)"
        
        elif self.selfeval_turn_counter == self.selfeval_turns: # time for self-evaluation
            self.selfeval_turn_counter = 0 # reset counter
            return self.self_evaluation(obs)
            
        try:
            if self.selfevaluated_last_turn and self.selfeval_turns > 1: # we need to disable thinking
                self.context += self.token_user + obs + self.token_nothink + self.token_endofturn
                self.selfevaluated_last_turn = False
            else:    
                self.context += self.token_user + obs + self.token_endofturn

            self.context += self.token_assistant # induces model to generate answer

            if self.first_move and self.handheld:
                self.first_move = False
                command = "help"
            else:
                response = self.generate_response()
                if len(response.split()) <= 10 or not self.handheld:
                    command = response
                else: # more than 10 words, output is surely wrong
                    command = "look"
            
            self.context += command + self.token_endofturn

            
            if self.verbose:
                print("GAME ++++++++++++++++++++++++++++++++++++++++++++++++++")
                print(obs)
                print("AGENT -------------------------------------------------")
                print(command)

            self.selfeval_turn_counter += 1
            return command
            
        except KeyboardInterrupt:
            pass  # Try stopping the game prematurely.

    def self_evaluation(self, obs) -> str :

        self_evaluation_prompt = """
Do you think you're making the right actions in the game so far? Do you think you're close to reaching the original goal?
Think about it, and then say your next action. Remember to only say the command and nothing else.
"""
        self.context += self.token_user + obs + self_evaluation_prompt + self.token_think + self.token_endofturn 
        self.context += self.token_assistant # induce thinking
        
        (thinking_response, response) = self.generate_response(think=True)
        if self.verbose:
            print("GAME ++++++++++++++++++++++++++++++++++++++++++++++++++")
            print(obs + self_evaluation_prompt + self.token_think)
            print("SELF-EVALUATION: +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-")
            print(thinking_response + response + self.token_nothink)

        if self.reads_own_reasoning:
            self.context += thinking_response + response + self.token_endofturn
        else:
            self.context += response + self.token_endofturn

        if len(response.split()) <= 10 or not self.handheld:
            command = response
        else: # more than 10 words, output is surely wrong
            command = "look"

        self.selfeval_turn_counter += 1
        if self.random_selfeval:
            self.randomize_selfeval_turn()
        self.selfevaluated_last_turn = True
        return command
        