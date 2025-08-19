FROM python:3.11-slim

# Get everything up-to-date
RUN apt-get update
RUN apt-get upgrade -qy

# Install system dependencies
RUN apt-get install -qy \
    build-essential \
    chromium \
    chromium-driver \
    curl \
    git \
    libffi-dev \
    python3-dev \
    python3-pip \
    wget \
    graphviz

RUN pip install --upgrade pip

RUN pip install jupyter transformers
RUN pip install -U "huggingface_hub[cli]"

# Install TextWorld; not sure if needed
# RUN pip install textworld

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

RUN git clone --single-branch --branch main https://github.com/microsoft/TextWorld.git /Main/TextWorld

RUN git clone --single-branch --branch main https://username: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@github.com/MizuGreg/LLMs-Play-Textual-Games.git /Main/LLM-PTG

# Install the visualization package for TW
RUN pip install /Main/TextWorld[vis]

# Environment variables
ENV DISPLAY=:99

# Allow access through jupyter server
CMD ["jupyter", "notebook", "/Main", "--ip", "0.0.0.0", "--allow-root"]
