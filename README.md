# metabase-multiarch-docker

![GitHub](https://img.shields.io/github/license/adrianoamalfi/metabase-multiarch-docker) ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/adrianoamalfi/metabase-multiarch-docker) ![Docker Pulls](https://img.shields.io/docker/pulls/adrianoamalfi/metabase-multiarch-docker)

This project create Universal Docker images for [Metabase](https://github.com/metabase/metabase/) an easy, open-source way for everyone to ask questions and learn from data.

| Platform        | Description                                                           |
|-------------------|-----------------------------------------------------------------------|
| linux/amd64        | Standard AMD64 Processors. |
| linux/amd64  | ARM64-based M1 chips, Ampere server or MacBook Air, MacBook Pro, and Mac mini models.     |
| linux/arm/v7    | ARMv7 processors, like Raspberry 2, Pandaboard, BeagleBoard, BeagleBone (Black). |


#### Running Locally with Docker

Download the Metavase Docker Image from Dockerhub:
```sh
docker pull adrianoamalfi/metabase-multiarch-docker
```

Run the Docker Container :
```sh
docker run -d -p 3000:3000 --name metabase adrianoamalfi/metabase-multiarch-docker

```

#### Using Docker Compose

Create a docker-compose.yaml:
```sh
version: "3.8"

services:
  app:
    image: adrianoamalfi/metabase-multiarch-docker
    restart: unless-stopped
    ports:
      - 3000:3000
```

