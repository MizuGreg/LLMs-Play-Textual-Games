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
