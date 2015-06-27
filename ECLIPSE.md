# Eclipse Remote IDE
Eclipse can connect to a docker container and use docker environment to build

You will need [Eclipse for Parallel Application Developers](http://www.eclipse.org/downloads/packages/eclipse-parallel-application-developers/lunasr2) that will allow you to connect to use Eclipse IDE and use your docker environment.



## Create New C/C++ remote project
![](http://i.imgur.com/dxAQnI4.png)

- Enter new project name
- Select GCC
- Create new connection to docker instance

![](http://i.imgur.com/bm7fIKv.png)
### Configure ssh connectivity to your sming docker instance. Make sure to fill out __CORRECT IP ADDRESS__
  - __Host__: Run ```docker-machine ip dev``` to get the ip.
  - __Username__: _root_
  - __Password__: _root_
  - __Port__: 8122

![](http://i.imgur.com/kU9rRpm.png)
### Specify project location
(On the docker instance box)
- __Location__: ```/root/workspace/<Project_Name>```
![](http://i.imgur.com/PQgMw32.png)

### Configure remote include paths (TBD)
(TBD)
(TBD)
(TBD)


You can also use eclipse as a terminal (ssh client):
![](http://i.imgur.com/YUWsFGL.png)
![](http://i.imgur.com/8mrQvuH.png)
![](http://i.imgur.com/rsHcB4f.png)