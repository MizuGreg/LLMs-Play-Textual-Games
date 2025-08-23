# Files for running a Docker container

In this folder is a Dockerfile. Run its image with `docker build --secret id=GITHUB_TOKEN -t mizugreg/politw:{new version number} .` and optional tags.

TextWorld unfortunately cannot be run on Windows. An alternative is running the Docker container (available on DockerHub). We will be running a modified version of that container, which I called politw. The command, to be run in an appropriate terminal, is:

`docker run -p 8888:8888 -it --gpus device=0 --name politw_cont --rm mizugreg/politw:{version number}`

optionally without `--rm` if you want to keep the container after stopping it.

For applying changes to the container and storing them in images, you can run the command:

`docker commit -m "{commit comments}" politw_cont mizugreg/politw:{new version number}`

The GitHub token to clone this repository has to be requested to [me](https://github.com/MizuGreg) personally. It is pulled from a file called `GITHUB_TOKEN.secret` located in the Docker folder.

The HuggingFace access token might be required for certain models who are not open access. It will be pulled automatically through `compose.yaml` from any `.env` file in the Docker folder.