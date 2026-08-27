# Alpine-Custom

Alpine-Custom is a lightweight, customizable Alpine-based image for running containers with additional packages and configuration.

## Getting Started

To get started with Alpine-Custom, follow these steps:

1. Pull the image and run the container with your desired packages:

```bash
docker run --rm -it \
  -e PACKAGES="restic rclone supercronic" \
  patrickap/alpine-custom:latest
```

You can also install specific package versions:

```bash
PACKAGES="restic=~=0.18.1 rclone~=1.74.1 supercronic~=0.2.39"
```

Alternatively, you can use Docker Compose:

```yml
services:
  alpine-custom:
    image: patrickap/alpine-custom:latest
    environment:
      - PACKAGES=restic rclone supercronic
    command: ["supercronic", "./custom.cron"]
```

## Contributing

To run Alpine-Custom locally, you have two options: either build the Docker image from the provided Dockerfile and execute it, or use `docker compose`. To publish a release, use the command `just release <patch|minor|major>`. This command will automatically increment the semantic version accordingly.
