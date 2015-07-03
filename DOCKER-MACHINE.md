# Docker Without Kitematic
## Windows

### Install via Chocolatey
```cmd
::cmd (Admin)
choco install git --params="/GitAndUnixToolsOnPath /NoAutoCrlf" -y
choco install virtualbox -y
choco install docker -y
choco install docker-machine -version 0.3.0 -y
```

### Start bash.exe and run following commands
Create a box
```
docker-machine -v
docker-machine create -d virtualbox dev
```

Stop docker-machine
```
docker-machine stop dev
```
Make sure to add your usb port forwarding to Virtual Box.
![](http://i.imgur.com/x1Po4Yl.png)
This will allow docker get access to usb2serial device connected to our host computer.

Start docker-machine back
```
docker-machine start dev
```

### Add docker parameters to your shell
```
eval `docker-machine env dev`
```

### Pull latest docker container
```
docker pull kireevco/sming-docker
```

### Run docker container with usb port forwarding
Use [README.md commands](README.md#run-docker-container-with-usb-port-forwarding) to run docker with required parameters (`docker run`)

### Open a browser pointing to c9 IDE 
```
start http://$(docker-machine ip dev):8181
```

### Or configure Net Beans
[Net Beans](NETBEANS.md) can be configured to use Docker environment.

## MacOS
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

Start docker-machine back
```
docker-machine start dev
```

#### Pull latest docker container
```
docker pull kireevco/sming-docker
```

### Run docker container with usb port forwarding
Use README.md commands to run docker with required parameters


#### Open a browser pointing to c9 IDE
```
open http://$(docker-machine ip dev):8181
```

