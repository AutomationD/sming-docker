Cloud9 v3 Dockerfile
=============

This repository contains Dockerfile of Cloud9 IDE for Docker's automated build published to the public Docker Hub Registry.

# Base Docker Image
[kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)

# Installation

## Install Docker.

### Windows
Install latest [boot2docker](https://github.com/boot2docker/windows-installer/releases) (+mysys git recommended). Run ```Boot2Docker Start``` from your Desktop
```
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