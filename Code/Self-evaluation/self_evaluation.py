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
# ## Play function

# %%
def play(agent, path, max_steps=100, n_episodes=10, verbose=True):
    torch.manual_seed(46)  # For reproducibility when using action sampling.

    infos_to_request = agent.infos_to_request
    infos_to_request.max_score = True  # Needed to normalize the scores.

    gamefiles = [path]
    if os.path.isdir(path):
        gamefiles = glob(os.path.join(path, "*.z8"))

    env_id = textworld.gym.register_games(gamefiles,
                                          request_infos=infos_to_request,
                                          max_episode_steps=max_steps)
    env = textworld.gym.make(env_id)  # Create a Gym environment to play the text game.
    if verbose:
        if os.path.isdir(path):
            print(os.path.dirname(path), end="")
        else:
            print(path, end=" ")

    # Collect some statistics
    avg_moves, avg_scores, avg_norm_scores = [], [], []
    moves_scores_times_list = []
    
    for _ in range(n_episodes):
        episode_start = time.process_time()
        obs, infos = env.reset()  # Start new episode.

        score = 0
        done = False
        nb_moves = 0
        moves_scores_times = [(0, 0, 0)] # starting point
        
        while not done:
            command = agent.act(obs, score, done, infos)
            timestamp = time.process_time()
            obs, score, done, infos = env.step(command)
            nb_moves += 1
            moves_scores_times.append((nb_moves, score, timestamp - episode_start))

        agent.act(obs, score, done, infos)  # Let the agent know the game is done.
        moves_scores_times_list.append(moves_scores_times)

        if verbose:
            print(".", end="")
        avg_moves.append(nb_moves)
        avg_scores.append(score)
        avg_norm_scores.append(score / infos["max_score"])

    env.close()
    if verbose:
        if os.path.isdir(path):
            msg = "  \tavg. steps: {:5.1f}; avg. normalized score: {:4.1f} / {}."
            print(msg.format(np.mean(avg_moves), np.mean(avg_norm_scores), 1))
            if len(avg_moves) > 1:
                print(f"Detailed steps: {avg_moves}\t Detailed normalized scores: {avg_norm_scores}")
        else:
            msg = "  \tavg. steps: {:5.1f}; avg. score: {:4.1f} / {}."
            print(msg.format(np.mean(avg_moves), np.mean(avg_scores), infos["max_score"]))
            if len(avg_moves) > 1:
                print(f"Detailed steps: {avg_moves}\t Detailed scores: {avg_scores}")
        return moves_scores_times_list














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
            raise KeyboardInterrupt

# %%
class LLMAgentSelfEvaluate(LLMAgent):
    """LLM from HuggingFace that acts as an agent. It self-evaluates its status and moves."""

    selfeval_turn_counter = 0
    selfeval_turns = 5
    selfevaluated_last_turn = False
    random_selfeval = False

    verbose = False
    log = ""

    handheld = True
    reads_own_reasoning = False

    system_prompt = """You are an assistant playing a textual game.
The user gives you information on the environment and you reply with a short command, like \"go north\". Only output the action, nothing else.
/no_think
"""
    selfeval_prompt ="""Do you think you're making the right actions in the game so far? Do you think you're close to reaching the original goal?
Think about it, and then say your next action. Remember to only say the command and nothing else.
"""
    prompt_version = "default"

    def __init__(self, model=model, tokenizer=tokenizer, prompt_version = "default",
    selfeval_turns = 5, random_selfeval = False,
    verbose = False, log = "",
    handheld = False, reads_own_reasoning = False):
        """Initialization function.
        selfeval_turns: how many turns should pass between a self-evaluation and the next one.
        random_selfeval: whether the self-evaluation turn counter should be random. It's randomized within an interval centered on selfeval_turns, if that value is passed
        handheld: if this is set to True there are a few simple changes in the function that make it easier for the LLM to understand and correct its course
        reads_own_reasoning: if the model's reasoning during the self-evaluation turns should be included in the context too, or only its final action
        """
        super().__init__(model, tokenizer)

        if selfeval_turns <= 0:
            self.selfeval_turns = -1 # actual default value for deactivating self-evaluation
        else:
            self.selfeval_turns = selfeval_turns
        self.random_selfeval = random_selfeval

        self.verbose = verbose
        self.log = log
        if self.log != "":
            self.clear_log()

        self.handheld = handheld 
        self.reads_own_reasoning = reads_own_reasoning

        self.prompt_version = prompt_version
        self.set_prompts()

        self.initialize_context()

    def clear_log(self):
        open(self.log, "w").close()

    def write_on_log(self, text):
        if self.log != "":
            with open(self.log, "a") as f:
                f.write(text + "\n")
                # file closing done automatically

    def set_prompts(self):
        if self.prompt_version == 1:
            self.system_prompt = """You are an assistant playing a textual game.
The user gives you information on the environment and you reply exclusively in the form \"verb noun\", like \"open box\" or \"take key\".
/no_think
"""
            self.selfeval_prompt ="""Do you think you're making the right actions in the game so far? Do you think you're close to reaching the original goal?
Think about it, and then say your next action. Remember to only say the command and nothing else.
"""
        elif self.prompt_version == 2:
            self.system_prompt = """You are an assistant playing a textual game.
The user gives you information on the environment and you reply with a short command, like \"take box\" or \"open chest with key\".
/no_think
"""
            self.selfeval_prompt ="""Do you think you're making the right actions in the game so far? Do you think you're close to reaching the original goal?
Think about it, and then say your next action. Remember to only say the command and nothing else.
"""
        elif self.prompt_version == 3:
            self.system_prompt = """You are an assistant playing a textual game.
The user gives you information on the environment and you reply with a short command, like \"go north\". Only output the action, nothing else.
/no_think
"""
            self.selfeval_prompt ="""Do you think you're making the right actions in the game so far? Do you think you're close to reaching the original goal?
Think about it, and then say your next action. Remember to only say the command and nothing else.
"""
        elif self.prompt_version == 4 or self.prompt_version == "default": # default
            self.system_prompt = """You are an assistant playing a textual game.
The user gives you information on the environment and you reply with a short command, like \"go north\". Only output the action, nothing else.
/no_think
"""
            self.selfeval_prompt ="""Do you think you're making the right actions in the game so far? Do you think you're close to reaching the original goal?
Think about it, and then say your next action. Remember to only say the command and nothing else.
""" # this will become CoT prompt in a future version

    def initialize_context(self):
        """A helper function for resetting the internal state of the model before starting a new game.
        """
        self.context = self.token_system + self.system_prompt + self.token_endofturn
        self.first_move = True
        self.selfeval_turn_counter = 0
        if self.random_selfeval:
            self.randomize_selfeval_turn()
        self.selvaluated_last_turn = False
        self.write_on_log("CONTEXT INITIALIZED +-+-+-+-+-+-+-+-+-+-")

    def randomize_selfeval_turn(self):
        """This function randomizes the self-evaluation turn counter every time the model is
        (re-)initialized and every time it does a self-evaluation turn.
        """
        mean = self.selfeval_turns
        self.selfeval_turns = random.randint(max(1, math.floor(mean/2)), math.ceil(mean + mean/2))

    def generate_response(self, think=False):
        if think:
            max_new_tokens = 10000 # allow reasoning models to be talkative
        else:
            max_new_tokens = 100 # reduce generation almost to a minimum
        
        input_ids = self.tokenizer.encode(
                self.context,
                return_tensors = "pt")
        try:
            if think:
                generated_ids = self.model.generate(
                    input_ids.to("cuda"),
                    max_new_tokens = max_new_tokens,
                    eos_token_id = self.tokenizer.eos_token_id,
                    # temperature=0.65, top_p=0.95, top_k=20, min_p=0,
                    )
            else:
                generated_ids = self.model.generate(
                    input_ids.to("cuda"),
                    max_new_tokens = max_new_tokens,
                    eos_token_id = self.tokenizer.eos_token_id,
                    # temperature=0.7, top_p=0.85, top_k=20, min_p=0
                    )
            output_ids = generated_ids[0][len(input_ids[0]):].tolist()
        except KeyboardInterrupt:
            raise KeyboardInterrupt
        except:
            return "help" # model is in distress :)

        if len(output_ids) >= 0.95 * max_new_tokens: # reached or almost reached cap -- let's help the model a bit
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
        # print(f"{self.selfeval_turn_counter}/{self.selfeval_turns}")
        if done:
            self.initialize_context() # resets context
            return ":)"
        elif self.selfeval_turn_counter == self.selfeval_turns: # time for self-evaluation
            self.selfeval_turn_counter = 0 # reset counter
            return self.self_evaluation(obs)
            
        try:
            if self.selfevaluated_last_turn: # we need to disable thinking
                self.context += self.token_user + obs + self.token_nothink + self.token_endofturn
                self.selfevaluated_last_turn = False
            else:    
                self.context += self.token_user + obs + self.token_endofturn

            self.context += self.token_assistant # induces model to generate answer

            if self.first_move and self.handheld:
                self.first_move = False
                command = "help"
            else:
                self.first_move = False
                response = self.generate_response()
                if not self.handheld or len(response.split()) <= 10:
                    command = response
                else: # more than 10 words, output is surely wrong
                    command = "look"
            
            self.context += command + self.token_endofturn

            turn_string = "GAME ++++++++++++++++++++++++++++++++++++++++++++++++++\n"                                           \
                        + obs + (self.token_nothink if self.selfevaluated_last_turn else "") + "\n" \
                        + "AGENT -------------------------------------------------\n"                                           \
                        + command
            if self.verbose:
                print(turn_string)
            if self.log != "":
                self.write_on_log(turn_string)

            self.selfeval_turn_counter += 1
            return command
        except KeyboardInterrupt:
            raise KeyboardInterrupt

    def self_evaluation(self, obs) -> str :
        self.context += self.token_user + obs + self.selfeval_prompt + self.token_think + self.token_endofturn 
        self.context += self.token_assistant # induce thinking
        
        (thinking_response, response) = self.generate_response(think=True)

        turn_string = "GAME ++++++++++++++++++++++++++++++++++++++++++++++++++\n" \
                    + obs + "\n"                                                  \
                    + "SELF-EVALUATION: +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-\n" \
                    + thinking_response + response
        if self.verbose:
            print(turn_string)
        if self.log != "":
            self.write_on_log(turn_string)

        if self.reads_own_reasoning:
            self.context += thinking_response + response + self.token_endofturn
        else:
            self.context += response + self.token_endofturn

        if len(response.split()) <= 10 or not self.handheld:
            command = response
        else: # more than 10 words, output is surely wrong
            command = "look"

        if self.random_selfeval:
            self.randomize_selfeval_turn()
        self.selfevaluated_last_turn = True
        self.selfeval_turn_counter += 1
        return command
        