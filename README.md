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


# Install & Configure Docker

## Prerequisites:
- This HOWTO is using docker-machine: an advanced version of boot2docker. Make sure to remove any boot2docker versions and it's vms before you proceed

## MacOS
Download and install latest [Kitematic](https://kitematic.com/download/):

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

Run docker container with usb port forwarding (from Docker cli)
```
docker run -it -d -p 8181:80 -p 8122:22 -p 4075:4075 --device=/dev/ttyUSB0 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=/dev/ttyUSB0``` portion_, `~/docker/sming-docker/workspace/` also has to exist.


#### Open a browser pointing to c9 IDE

![](http://i.imgur.com/FJrHQHp.png)

## Windows
Download and install latest [Kitematic](https://kitematic.com/download/):
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

Run docker container with usb port forwarding (from Docker cli)
### Run docker container with usb port forwarding
```
docker run -it -d -p 8181:80 -p 8122:22 --device=//dev/ttyUSB0 -v /c/Users/$env:username/sming/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=//dev/ttyUSB0``` portion_, `c:\Users\<your_user>\sming` also has to exist

#### Open a browser pointing to c9 IDE
![](http://i.imgur.com/FJrHQHp.png)

# Eclipse IDE (optional)



---
This repository contains Dockerfile of [Sming framework](github.com/anakod/Sming), [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) and [Cloud9 IDE](https://github.com/c9/core) with [Cloud 9 C++ Plugin](https://github.com/invokr/c9.ide.language.cpp). Automated build published to the public Docker Hub Registry.


_Based on [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)_