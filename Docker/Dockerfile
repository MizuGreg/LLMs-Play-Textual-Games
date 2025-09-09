FROM marccote19/textworld
# FROM python:3.11-slim
# FROM mizugreg/politw:0.6

# Get everything up-to-date
# RUN apt-get update
# RUN apt-get upgrade -qy

# Install system dependencies
# RUN apt-get install -qy \
#     build-essential \
#     chromium \
#     chromium-driver \
#     curl \
#     git \
#     libffi-dev \
#     python3-dev \
#     python3-pip \
#     wget \
#     graphviz

# RUN pip install --upgrade pip setuptools wheel
# RUN pip install jupyter

RUN pip install transformers accelerate bitsandbytes
RUN pip install -U "huggingface_hub[cli]"

# Install TextWorld
# RUN pip install textworld

# This fucker...
RUN pip install --upgrade jericho

# RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

ARG GITHUB_CACHED_VERSION=d074e0de31324f61e06ec2e0500751af6fec7bf2
RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN \
    git clone --single-branch --branch main https://${GITHUB_TOKEN}/MizuGreg/LLMs-Play-Textual-Games.git /TextWorld/notebooks/LLM-PTG

# Install the visualization package for TW
# RUN pip install /Main/TextWorld[vis]

# Environment variables
# ENV DISPLAY=:99

# Allow access through jupyter server
# CMD ["jupyter", "notebook", "/Main", "--ip", "0.0.0.0", "--allow-root"]
