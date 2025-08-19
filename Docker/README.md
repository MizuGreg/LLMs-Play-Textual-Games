# Files for running a Docker container

In this folder is a Dockerfile. Run its image with `docker build -t "politw" .` and optional tags.

TextWorld unfortunately cannot be run on Windows. An alternative is running the Docker container (available on DockerHub). We will be running a modified version of that container, which I called politw. The command, to be run in an appropriate terminal, is:

`docker run -p 8888:8888 -it --gpus device=0 --name politw_cont politw:{version number}`

optionally with `--rm` to remove the container after stopping it.

For applying changes to the container and storing them in images, you can run the command:

`docker commit -m "{commit comments}" politw_cont politw:{new version number}`

The HuggingFace access token might be required for certain models who are not open access. In that case, please create a `webapp.env` file here, with the line `HF_TOKEN =` followed by your HuggingFace token (either copy-paste it from HuggingFace, or use `$HF_TOKEN` if it's already set as an environment variable in your OS). It will be pulled automatically through the `compose.yaml` file.

The GitHub token to clone this repository has to be requested to me personally instead. It is pulled from the `webapp.env` file too.