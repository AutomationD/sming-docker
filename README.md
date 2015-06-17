Sming Docker
=============
Sming docker container is used to simplify environment configuration for cross-platform systems. 
- Features (beta)
  - Out-of-the-box experience, just run the docker container
  - Fully tested and compatible ESP8266 dev environment without hassle
  - Web-Browser IDE (no Eclipse required)
  - Firmware flashing

- TODO (soon)
  - [KiteMatic](http://kitematic.com) integration for Windows
  - Convinient terminal connection via _(?)remserial_


# Install & Configure Docker

## Prerequisites:
- This HOWTO is using docker-machine: an advanced version of boot2docker. Make sure to remove any boot2docker versions and it's vms before you proceed

## MacOS & Linux
Download latest docker-machine and docker client:

```
curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_darwin-amd64 > /usr/local/bin/docker-machine
curl -L https://get.docker.com/builds/Darwin/x86_64/docker-latest > /usr/local/bin/docker
chmod +x /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker

docker-machine -v
docker-machine create --driver virtualbox dev
```

### Make sure to add USB port forwarding
Stop docker-machine
```
docker-machine stop dev
```
Configure VirtualBox:
![](http://i.imgur.com/x1Po4Yl.png)

This will allow docker get access to usb2serial device connected to our host computer.


#### Pull latest docker container
```
docker pull kireevco/sming-docker
```

Run docker container with usb port forwarding
```
eval "$(docker-machine env dev)"
docker run -it -d -p 8181:80 --device=/dev/ttyUSB0 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=/dev/ttyUSB0``` portion_


#### Open a browser pointing to c9 IDE
```
open http://$(docker-machine ip dev):8181
```


## Windows

### Install MsysGit
Use [msysgit](https://msysgit.github.io/) package _OR_ via chocolatey:
```cmd
::cmd (Admin)
choco install git
```
Make sure to add it to PATH:
```cmd
::cmd (Admin)
setx PATH /M "C:\Program Files (x86)\Git\bin;%PATH%" && set PATH="C:\Program Files (x86)\Git\bin;%PATH%"
```

### Start bash.exe and run following commands
```
curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_windows-amd64.exe > /bin/docker-machine --insecure
curl -L https://get.docker.com/builds/Windows/x86_64/docker-latest.exe > /bin/docker 
```

Make sure to add your usb port forwarding to Virtual Box.
```
docker-machine stop dev
```
![](http://i.imgur.com/x1Po4Yl.png)
This will allow docker get access to usb2serial device connected to our host computer.

### Pull latest docker container
```
docker pull kireevco/sming-docker
```

### Run docker container with usb port forwarding
```
eval "$(docker-machine env dev)"
docker run -it -d -p 8181:80 --device=//dev/ttyUSB0 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=//dev/ttyUSB0``` portion_

#### Open a browser pointing to c9 IDE
```
start http://$(docker-machine ip dev):8181
```

# Eclipse IDE (optional)
![](http://i.imgur.com/rsHcB4f.png)

You can also use [Eclipse for Parallel Application Developers](http://www.eclipse.org/downloads/packages/eclipse-parallel-application-developers/lunasr2) that will allow you to connect to use Eclipse IDE and use your docker environment.

- Create New C/C++ remote project
- Configure ssh connectivity to your sming docker instance
  - __Host__: Run ```docker-machine ip dev``` to get the ip.
  - __Username__: _root_
  - __Password__: _root_
  - __Project Home__: ```/root/workspace```
- Configure remote include paths (TBD)


You can also use eclipse as a terminal (ssh client):
![](http://i.imgur.com/YUWsFGL.png)


---
This repository contains Dockerfile of [Sming framework](github.com/anakod/Sming), [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) and [Cloud9 IDE](https://github.com/c9/core) with [Cloud 9 C++ Plugin](https://github.com/invokr/c9.ide.language.cpp). Automated build published to the public Docker Hub Registry.


_Based on [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)_