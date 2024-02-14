# TeamCity Docker Compose

This repository contains docker files for running a [TeamCity](https://www.jetbrains.com/teamcity/) server with multiple android build agents.

## Official Jetbrains docker images
* From DockerHub - [server](https://hub.docker.com/r/jetbrains/teamcity-server) and [agent](https://hub.docker.com/r/jetbrains/teamcity-agent)
* From Github - [repository](https://github.com/JetBrains/teamcity-docker-images)

## Build agent installed packages

| Package | Version |
| ---- | ---- |
| Java | 11 |
| Android command line tools | 3.0 |
| Android build tools | 30.0.3 |
| Android platform tools | * |
| Android platform | 33 |

:sparkles: You can customize the installed packages using the arguments in `docker-compose.yml` file.

## How use?

To run `docker-compose` use command:

```sh
make start
```

To stop `docker-compose` use command:
```sh
make stop
```