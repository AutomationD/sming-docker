## MacOS
```
#### NetBeans Install
echo "Installing NetBeans CPP"
brew install Caskroom/cask/netbeans-cpp
echo "If that doesn't work just install manually from https://netbeans.org/downloads/index.html"
#####

NB_APP='/Applications/NetBeans/NetBeans 8.0.2.app'
ESP_HOME='/opt/esp-open-sdk'
SMING_HOME='/opt/sming/Sming'
CPATH="\
${ESP_HOME}/sdk/include:\
${ESP_HOME}/xtensa-lx106-elf/xtensa-lx106-elf/include/:\
${ESP_HOME}/xtensa-lx106-elf/include/:\
${SMING_HOME}:\
${SMING_HOME}/include:\
${SMING_HOME}/SmingCore:\
${SMING_HOME}/system/include:\
${SMING_HOME}/Libraries:\
${SMING_HOME}/Services:\
${SMING_HOME}/Wiring:\
/opt/sming:\
./include\
"


####
echo "Backup Netbeans plist"
cp $NB_APP/Contents/Info.plist $NB_APP/Contents/Info.plist_bak

echo "Add ESP_HOME"
/usr/libexec/PlistBuddy -c "Delete :LSEnvironment:ESP_HOME" $NB_APP/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :LSEnvironment:ESP_HOME string '${ESP_HOME}'" $NB_APP/Contents/Info.plist

echo "Add SMING_HOME"
/usr/libexec/PlistBuddy -c "Delete :LSEnvironment:SMING_HOME" $NB_APP/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :LSEnvironment:SMING_HOME string '${SMING_HOME}'" $NB_APP/Contents/Info.plist

echo "Add CPATH"
/usr/libexec/PlistBuddy -c "Delete :LSEnvironment:CPATH" $NB_APP/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :LSEnvironment:CPATH string '${CPATH}'" $NB_APP/Contents/Info.plist

/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -v -f $NB_APP
```


#### If your serial device changes names on every reconnect you can link it like this:
```
sudo ln -s /dev/tty.wchusbserial* /dev/tty.usbserial
```