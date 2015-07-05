Sming Docker
=============
Sming docker container is used to simplify environment configuration for cross-platform systems.

You will get a self-contained browser based C++ development where you can build your sming projects and flash them to your ESP device!
![](http://content.screencast.com/users/kireevco/folders/Jing/media/487ab7c5-b4f2-4df9-9900-1450376e451e/00000014.png)

### Features (beta)
  - [KiteMatic](http://kitematic.com) integration for Windows & MacOS
  - Out-of-the-box experience, just run the docker container
  - Fully tested and compatible ESP8266 dev environment without hassle
  - Alternative Web-Browser IDE (c9)
  - [NetBeans](NETBEANS.md) Integration with Code assistance and Doxygen
  - Firmware flashing
  - Convinient terminal connection ([PR](https://github.com/anakod/Sming/pull/148) pending): Automatic (re) connection after every `make flash`

### TODO (soon)
- ?
  
_If something is not working, please refer to [TROUBLESHOOTING](TROUBLESHOOTING.md).
Kitematic is, pretty much, a GUI for [docker-machine](DOCKER-MACHINE.md). You can use it instead of Kitematic._


# Install & Configure Docker

## Prerequisites:
- __BEFORE GOING ANY FURTHER__ Make sure [Virtualization](TROUBLESHOOTING.md#enable-hardware-virtualization) is enabled in BIOS
- Kitematic __doesn't support 32 bit Windows__ (yet) If you have 32 bit Windows follow [docker-machine](DOCKER-MACHINE.md) way.
- Make sure to remove any previous boot2docker versions and it's vms before you proceed
- If you had virtualbox before Kitematic installation, plese [remove all Host-Networks](TROUBLESHOOTING.md#remove-networks-that-are-configured-in-virtualbox-before-installing-kitematic)

## Windows
- Download and install latest [Kitematic](https://kitematic.com/download/)
- Make sure `c:\Users\<Your_Username>\sming` exists - docker will map this directory to `~/workspace`. 
- Place your project (`Basic_Blink`) to `c:\Users\<Your_Username>\sming`. You will need it to import to NetBeans.

### Get sming-docker container from docker hub
- Click _New_
- Search for `sming`
- Click _Create_

### Open Docker CLI
Click on __DOCKER CLI__ button
![](http://content.screencast.com/users/kireevco/folders/Jing/media/61230801-a794-4a01-9cbe-f4545bec50c0/00000027.png)

### Make sure to add USB port forwarding
Stop docker-machine
```
docker-machine stop kitematic
```
Configure VirtualBox:
![](http://content.screencast.com/users/kireevco/folders/Jing/media/51230272-4b1e-47c4-b2cb-1edf3bc77ee2/00000029.png)

This will allow docker get access to usb2serial device connected to our host computer.

Start docker-machine back
```
docker-machine start kitematic
```

Run docker container with usb port forwarding (from Docker cli)
### Run docker container with usb port forwarding
(There is a [feature request](https://github.com/kitematic/kitematic/issues/764) that will allow skip this step). Please vote for it!
```
docker run -it -d -p 8181:80 -p 8122:22 -p 4075:4075 --device=//dev/ttyUSB0 -v /c/Users/$env:username/sming/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=//dev/ttyUSB0``` portion_, `c:\Users\<your_user>\sming` also has to exist

#### Open a browser pointing to c9 IDE
![](http://i.imgur.com/FJrHQHp.png)

## MacOS
- Download and install latest [Kitematic](https://kitematic.com/download/):
- Make sure `~/docker/sming-docker/workspace/` exists


### Get sming-docker container from docker hub
- Click _New_
- Search for `sming`
- Click _Create_

### Open Docker CLI
Click on __DOCKER CLI__ button
![](http://content.screencast.com/users/kireevco/folders/Jing/media/61230801-a794-4a01-9cbe-f4545bec50c0/00000027.png)

### Make sure to add USB port forwarding
Stop docker-machine
```
docker-machine stop kitematic
```
Configure VirtualBox
![](http://content.screencast.com/users/kireevco/folders/Jing/media/51230272-4b1e-47c4-b2cb-1edf3bc77ee2/00000029.png)

This will allow docker get access to usb2serial device connected to our host computer.

Start docker-machine back
```
docker-machine start kitematic
```


### Run docker container with usb port forwarding (from Docker cli)
(There is a [feature request](https://github.com/kitematic/kitematic/issues/764) that will allow skip this step). Please vote for it!
```
docker run -it -d -p 8181:80 -p 8122:22 -p 4075:4075 --device=/dev/ttyUSB0 -v ~/docker/sming-docker/workspace/:/root/workspace/ kireevco/sming-docker
```
_USB device has to be connected. Otherwise omit ```--device=/dev/ttyUSB0``` portion_, `~/docker/sming-docker/workspace/` also has to exist.


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

### Run the conatiner, binding directory with workspace to the container and binding container's ports to localhost:
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


# Additional Tools & Settings

## NetBeans IDE (recommended)
NetBeans can connect to a docker container and use docker environment to build.
Code completion & documentation works well.
![](http://content.screencast.com/users/kireevco/folders/Jing/media/50a86587-4069-49dd-afce-3464a58c766a/00000015.png)
See [NETBEANS.md](NETBEANS.md)

## Global Environmental Variables
You can set your gloval Environmental Variables in Kitematic. Just make sure to restart the container after adding/changing ones.
![](http://content.screencast.com/users/kireevco/folders/Jing/media/a5916c91-3c8d-4bb4-b5c4-baa2a546de06/00000037.png)

---
This repository contains Dockerfile of [Sming framework](github.com/anakod/Sming), [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) and [Cloud9 IDE](https://github.com/c9/core) with [Cloud 9 C++ Plugin](https://github.com/invokr/c9.ide.language.cpp). Automated build published to the public Docker Hub Registry.

_Based on [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/)_
