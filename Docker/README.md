# Files for running a Docker container

TextWorld unfortunately cannot be run on Windows. An alternative is running the Docker container (available on DockerHub). We will be running a modified version of that container, which I called politw. See [this section](#with-docker-compose).

The GitHub token needed to clone this repository has to be requested to [me](https://github.com/MizuGreg) personally. It is pulled from a file called `GITHUB_TOKEN` located in the Docker folder.
The HuggingFace access token might also be required for certain models who are not open access. It is passed as environment variable.

## With Docker Compose
I'm working on a version that uses `compose.yaml` so that the process is cleaner. The commands are
`docker compose up --build` and
`docker compose down` to stop and remove the container.
Remember to bump the image version in the `compose.yaml` quite often, for safety.

## (Deprecated) With Docker commands
Alternatively, build the image with `docker build --secret id=GITHUB_TOKEN -t mizugreg/politw:{VERSION} .` with the new version number and then run it with `docker run -p 8888:8888 -it --gpus device=0 --name politw_cont --rm mizugreg/politw:{VERSION}`, optionally without `--rm` if you want to keep the container after stopping it.

Or in a more concise way: `set version=` followed by the version number, and
`docker build --secret id=GITHUB_TOKEN -t mizugreg/politw:%version% . && docker run -p 8888:8888 -it --gpus device=0 --name politw_cont --rm mizugreg/politw:%version%`.

For applying changes to the container and storing them in images, you can run the command:
`docker commit -m "{description here}" politw_cont mizugreg/politw:{NEW VERSION}`.
