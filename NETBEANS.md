# NetBeans Remote IDE
NetBens can connect to a docker container and use docker environment to build remotely

You will need:
- [NetBeans C/C++](https://netbeans.org/downloads/)
- Project source files on your local machine (for instance, on Mac `~/docker/sming-docker/workspace/Test_Project` or `c:\Users\<Your_Username>\sming\Test_Project` on Windows. It should contain `Makefile` and `Makefile-user.mk`

## Create New Remote Host
### On the _Services_ Tab Right click on the _C/C++ Build Hosts_
![](http://content.screencast.com/users/kireevco/folders/Jing/media/14204218-76e9-4a33-bde9-fd14d6402fa9/00000003.png)

### Configure ssh connectivity to your sming docker instance. Make sure to fill out __CORRECT IP ADDRESS__ and __PORT__
  - __Hostname__: Run ```docker-machine ip dev``` to get the ip.
  - __Login__: _root_
  - __Password__: _root_
  - __Port__: 8122


![](http://content.screencast.com/users/kireevco/folders/Jing/media/1f72f7c5-a6ef-4e61-ad50-1651a645713f/00000002.png)

__Username__: _root_
![](http://content.screencast.com/users/kireevco/folders/Jing/media/a7d99deb-437c-47ba-9ef2-990533a72374/00000004.png)

Set remote server __Display name__: _sming_ and change __Access project files via__ _SFTP_
![](http://content.screencast.com/users/kireevco/folders/Jing/media/4c0a7f15-db65-4a67-aa63-c134d3d9f8cd/00000005.png)

_Connect_ to sming instance and configure default connection
![](http://content.screencast.com/users/kireevco/folders/Jing/media/7e5f9280-d06a-4b81-9c85-986d475b3d19/00000007.png)

## Create New Project
Select _C/C++ Project with Existing Sources_
![](http://content.screencast.com/users/kireevco/folders/Jing/media/46b75755-ae5d-4c12-8ea6-d9092ad56687/00000008.png)

Select Project Directory (has to contain your project already) and click __Finish__
![](http://content.screencast.com/users/kireevco/folders/Jing/media/60e991b1-40a8-48f3-84d6-c1aa3ddcd3f5/00000009.png)