# Don't Overthink It: Intermittent Self-Evaluation in Reasoning Language Models Playing Textual Games

Repository for the code related to my MSc thesis project.

The project explores the capabilities of RLMs playing textual games, and tentatively defines a game-agnostic framework for exploiting the advantages of reasoning and CoT prompting while avoiding some of the associated pitfalls and disadvantages.

<img width="1366" height="792" alt="overview1" src="https://github.com/user-attachments/assets/0cd3b957-89fe-4cf5-8d8c-bcf28e975b63" />


## Abstract

Reasoning Language Models have remarkable problem-solving capabilities that bring them even closer to human performance compared to standard LLMs, albeit gaining two traits that are typical of human agents: an increased response time and a heightened risk of overthinking. We choose the text-based games of TextWorld as a comprehensive example of a complex task environment, and present two novel and related techniques that counteract high response time and overthinking: <b>$n$-think</b> and <b>ephemerality</b>.

N-think models employ reasoning only every $n$ turns and, in that turn, they follow a self-evaluation prompt that increases context awareness, recall, and performance; in all other turns, reasoning is deactivated and thus inference time is minimized. Ephemeral $n$-think models instead do not retain their thought process in the context once the self-evaluation turn ends, but only their final response; in this way, the game content is not diluted by excessive thinking. These techniques curtail answer length and context length respectively, which are two critical components that slow down inference and carry an increased risk of overthinking.

The ephemeral 1-think configuration exhibits the highest performance by drastically reducing overthinking, whereas at higher values of $n$ the impact of ephemerality is either negative or negligible. Non-ephemeral $n$-think with low $n$ (e.g. 4) is also a promising configuration that noticeably reduces execution time with a small decrease in score.

We then implement two successful improvements to the $n$-think technique, namely random $n$-think and Chain-of-Thought-based self-evaluation; perform a qualitative analysis on the behaviors and patterns exhibited during self-evaluation turns with and without CoT; and finally identify future developments to the framework like ask-to-think, dynamic $n$-think, semi-ephemerality, or an application in real-time games.

## Paper

TBD

