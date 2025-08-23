FROM mizugreg/politw:0.6

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

# RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN \
    git clone --single-branch --branch main https://${GITHUB_TOKEN}/MizuGreg/LLMs-Play-Textual-Games.git /Main/LLM-PTG

# Install the visualization package for TW
# RUN pip install /Main/TextWorld[vis]

# Environment variables
# ENV DISPLAY=:99

# Allow access through jupyter server
# CMD ["jupyter", "notebook", "/Main", "--ip", "0.0.0.0", "--allow-root"]
