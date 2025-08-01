"""
PoliGame is intended to be a reverse-engineered version of TextWorld which has more customizable challenges, and some additional challenges to TextWorld's own ones.
This module's development has been paused for now.
This is the main script, which acts as an interface for humans and LLMs to access the minigames, which are called "challenges", out of coherence with TextWorld's naming convention.
LLMs send actions and receive responses through the class Game's methods.
"""

import os
import challenges

class Game:
    input_type = ""
    challenge_names = []

    def __init__(self, input_type):
        self.challenge_names = [f.name.removesuffix(".py") for f in list(os.scandir('./Code/Utilities/PoliGame'))]
        if input_type == "human" or "llm":
            self.input_type = input_type
        else:
            raise Exception('Input type not recognized. It has to be either "human" or "llm".')
    
    def start_challenge(self, challenge_type):
        if challenge_type not in self.challenge_names:
            raise Exception('Challenge name not recognized. It has to be one of the existing challenges in the "challenges" folder.')
