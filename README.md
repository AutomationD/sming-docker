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
Install latest docker [for your distro](https://docs.docker.com/installation/). For ubuntu run (this will add docker PPA repo also):
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker
```

Not necessary, but useful - add yourself to the docker group, so you can controll docker containers without 'sudo':
```
adduser <me> docker
```

Fetch latest sming-docker:
```
docker pull sming-docker
```

Run the conatiner, binding directory with workspace to the container and binding container's ports to localhost:
```
docker run -d --name esp -p 8180:80 -p 8122:22 -p 4075:4075 -p 10000:10000 \
-v ~/my_workspace/esp8266:/root/workspace:rw 
kireevco/sming-docker
```

If you want to use git inside the container, it's good to make your keys available inside. Use the following command instead:
```
docker run -d --name esp -p 8180:80 -p 8122:22 -p 4075:4075 -p 10000:10000 \
-v ~/.ssh:/root/.ssh \
-v ~/my_workspace/esp8266:/root/workspace:rw 
kireevco/sming-docker
```

Now just open in your browser [cloud9 IDE](http://localhost:8180/).

_Based on [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)_
