Cloud9 v3 Dockerfile
=============

This repository contains Dockerfile of Cloud9 IDE for Docker's automated build published to the public Docker Hub Registry.

# Base Docker Image
[kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)

# Installation

## Install Docker.

### Windows
Install latest [boot2docker](https://github.com/boot2docker/windows-installer/releases) (+mysys git recommended)
```cmd
boot2docker init
boot2docker up

FOR /F %I IN ('boot2docker ip') DO SET DOCKER_IP=%I
SETX /M DOCKER_HOST tcp://%DOCKER_IP%:2375

set SMING_WORKSPACE=%userprofile%\docker\sming-docker\workspace
mkdir %SMING_WORKSPACE%
docker pull kireevco/sming-docker
cd %SMING_WORKSPACE%
docker run -it -d -p 8181:80 -v .:/root/workspace/ kireevco/sming-docker

start http://%DOCKER_IP%:8181
```

### MacOS
Install latest [boot2docker](https://github.com/boot2docker/osx-installer/releases)
```shell
boot2docker init
boot2docker up
export DOCKER_IP=$(boot2docker ip 2>/dev/null)
export DOCKER_HOST="tcp://${DOCKER_IP}:2375"

docker pull kireevco/sming-docker
mkdir -p ~/docker/sming-docker/workspace/
docker run -it -d -p 8181:80 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
open http://$DOCKER_IP:8181
```

Add usb port forwarding
```
VboxManage ...
```