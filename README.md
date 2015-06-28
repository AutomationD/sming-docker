Sming Docker
=============
Sming docker container is used to simplify environment configuration for cross-platform systems. 
- Features (beta)
  - [KiteMatic](http://kitematic.com) integration for Windows & MacOS
  - Out-of-the-box experience, just run the docker container
  - Fully tested and compatible ESP8266 dev environment without hassle
  - Web-Browser IDE (no Eclipse required)
  - Firmware flashing

- TODO (soon)
  
  - Convinient terminal connection via _(?)remserial_


If something is not working, please refer to [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
Kitematic is, pretty much, a GUI for [docker-machine](DOCKER-MACHINE.md). You can use it instead of Kitematic.


# Install & Configure Docker

## Prerequisites:
- This HOWTO is using docker-machine for MacOS and Windows: an advanced version of boot2docker. Make sure to remove any boot2docker versions and it's vms before you proceed

## MacOS
- Download and install latest [Kitematic](https://kitematic.com/download/):
- Make sure `~/docker/sming-docker/workspace/` exists


### Get sming-docker container from docker hub
- Click _New_
- Search for `sming`
- Click _Create_

### Open Docker CLI
![](http://i.imgur.com/bR6uUne.png)

### Make sure to add USB port forwarding
Stop docker-machine
```
docker-machine stop dev
```
Configure VirtualBox
![](http://i.imgur.com/x1Po4Yl.png)

This will allow docker get access to usb2serial device connected to our host computer.

Start docker-machine back
```
docker-machine start dev
```


Run docker container with usb port forwarding (from Docker cli)
```
docker run -it -d -p 8181:80 -p 8122:22 -p 4075:4075 --device=/dev/ttyUSB0 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=/dev/ttyUSB0``` portion_, `~/docker/sming-docker/workspace/` also has to exist.


#### Open a browser pointing to c9 IDE

![](http://i.imgur.com/FJrHQHp.png)

## Windows
- Download and install latest [Kitematic](https://kitematic.com/download/)
- Make sure `c:\Users\<Your_Username>\sming` exists

### Get sming-docker container from docker hub
- Click _New_
- Search for `sming`
- Click _Create_

### Open Docker CLI
![](http://i.imgur.com/bR6uUne.png)

### Make sure to add USB port forwarding
Stop docker-machine
```
docker-machine stop dev
```
Configure VirtualBox:
![](http://i.imgur.com/x1Po4Yl.png)

This will allow docker get access to usb2serial device connected to our host computer.

Start docker-machine back
```
docker-machine start dev
```

Run docker container with usb port forwarding (from Docker cli)
### Run docker container with usb port forwarding
```
docker run -it -d -p 8181:80 -p 8122:22 -p 4075:4075 --device=//dev/ttyUSB0 -v /c/Users/$env:username/sming/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=//dev/ttyUSB0``` portion_, `c:\Users\<your_user>\sming` also has to exist

#### Open a browser pointing to c9 IDE
![](http://i.imgur.com/FJrHQHp.png)

## Linux
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
-v ~/my_workspace/esp8266:/root/workspace:rw \
kireevco/sming-docker
```

If you want to use git inside the container, it's good to make your keys available inside. Use the following command instead:
```
docker run -d --name esp -p 8180:80 -p 8122:22 -p 4075:4075 -p 10000:10000 \
-v ~/.ssh:/root/.ssh \
-v ~/my_workspace/esp8266:/root/workspace:rw \
kireevco/sming-docker
```

If you want to make your USB-serial converter available in the container, add:
```
--device=/dev/ttyUSB0
```
to the ```docker run``` command above, but this will force you to have it attached to USB every time you start the container.

Now just open in your browser [cloud9 IDE](http://localhost:8180/).

# Eclipse IDE (optional)
Eclipse can connect to a docker container and use docker environment to build. 
See [](ECLIPSE.md)


---
This repository contains Dockerfile of [Sming framework](github.com/anakod/Sming), [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) and [Cloud9 IDE](https://github.com/c9/core) with [Cloud 9 C++ Plugin](https://github.com/invokr/c9.ide.language.cpp). Automated build published to the public Docker Hub Registry.

_Based on [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)_
