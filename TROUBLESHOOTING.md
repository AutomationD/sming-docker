Troubleshooting Kitematic / Docker
=============

If you got stuck with sming-docker this document will try to help you. Follow the instructions.

# Windows
Windows version of Kitematic is still quite new. You can also try bare-bones [docker-machine](https://github.com/kireevco/sming-docker/blob/master/DOCKER-MACHINE.md) way.

## Kitematic installation doesn't work
Installation won't finish or stuck. Please make sure to try the following steps

### Enable Hardware Virtualization
- Make sure your hardware virtualization is [enabled in BIOS](http://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/sect-Virtualization-Troubleshooting-Enabling_Intel_VT_and_AMD_V_virtualization_hardware_extensions_in_BIOS.html). Consider using [Windows Virtualization Tool](http://www.microsoft.com/en-us/download/details.aspx?id=592) it can be very helpful.
- Make sure _no other_ hypervizor is installed (like Microsoft Hyper-V)

### Remove networks that are configured in Virtualbox before installing Kitematic
Sometimes there is an issue with initial Kitematic configuration (stuck at 99%)
~[](http://content.screencast.com/users/kireevco/folders/Jing/media/f3299842-9e77-4699-b117-d7d2528226f0/00000026.png)
- Go to VirtualBox Preferences -> Network
- Remove everything from NAT Networks & Host-Only Networks
- Close VirtualBox and restart Kitematic

### Completely Reinstall Kitematic & Virtualbox
If nothing is helping, try completely reinstalling everything.
- Uninstall Kitematic
- Uninstall Virtualbox
- Download new setup file for Kitematic
- Run Kitematic setup as administrator & follow the guidelines

## Build or some feature is not working
Get latest docker container:
`docker pull kireevco/sming-docker` or via Kitematic.


# MacOS
TBD, PRs are welcome

# Linux
TBD, PRs are welcome

## Getting more information about WHY Kitematic VM is not working
In order to get more detail about why kitematic VM is not starting do the following:
- Quit Kitematic
- Start VirtualBox
- Find _dev_ or _kitematic_ VM
- Start it and watch messages on the screen. Post Screenshots to support channel if nessesary.
