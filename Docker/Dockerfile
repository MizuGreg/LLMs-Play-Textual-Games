FROM python:3.11-slim

# Get everything up-to-date; takes 10 seconds
RUN apt-get update
RUN apt-get upgrade -qy

# Install system dependencies; takes 1.5 mins
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

# Install Jupyter; takes 50 seconds
RUN pip install jupyter

# Install PyTorch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

# Clone the TextWorld repo; takes 3 seconds
RUN git clone --single-branch --branch main https://github.com/microsoft/TextWorld.git /TextWorld

# Install the visualization package for TW; takes 2 mins
RUN pip install /TextWorld[vis]

# Environment variables
ENV DISPLAY=:99

CMD ["jupyter", "notebook", "/TextWorld/notebooks", "--ip", "0.0.0.0", "--allow-root"]
