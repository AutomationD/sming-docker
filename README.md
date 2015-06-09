Sming Docker
=============

This repository contains Dockerfile of [Sming framework](github.com/anakod/Sming), [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) and [Cloud9 IDE](https://github.com/c9/core) with [Cloud 9 C++ Plugin](https://github.com/invokr/c9.ide.language.cpp). Automated build published to the public Docker Hub Registry.

# Installation

## Install Docker

### Windows
Install latest [boot2docker](https://github.com/boot2docker/windows-installer/releases) (+mysys git recommended). Run ```Boot2Docker Start``` from your Desktop
```
# Boot2Docker Shell
boot2docker init
boot2docker up

export DOCKER_IP=$(boot2docker ip 2>/dev/null)
export DOCKER_HOST="tcp://${DOCKER_IP}:2376"
export SMING_WORKSPACE=~/docker/sming-docker/workspace/
mkdir -p ~/docker/sming-docker/workspace/

cd $SMING_WORKSPACE

docker pull kireevco/sming-docker
docker run -it -d -p 8181:80 --device=/dev/ttyUSB0 kireevco/sming-docker

start http://$DOCKER_IP:8181
```

### MacOS

Install latest [boot2docker](https://github.com/boot2docker/osx-installer/releases)
```
#!/bin/bash
boot2docker init
boot2docker up
export DOCKER_IP=$(boot2docker ip 2>/dev/null)
export DOCKER_HOST="tcp://${DOCKER_IP}:2376"
export SMING_WORKSPACE=~/docker/sming-docker/workspace/
mkdir -p ~/docker/sming-docker/workspace/

docker pull kireevco/sming-docker
docker run -it -d -p 8181:80 --device=/dev/ttyUSB0 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
open http://$DOCKER_IP:8181
```

In order to flash firmware to your device you need to confugre usb port forwarding. Start your virtualbox, stop your boot2docker vm and add USB to your port forwarding:
![](http://i.imgur.com/x1Po4Yl.png)


### Linux
Use native docker


_Based on [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)_