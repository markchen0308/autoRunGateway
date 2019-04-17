#!/bin/sh

#get account in config.json
account=$(grep -Po '"account":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')

#get passwd in config.json
passwd=$(grep -Po '"passwd":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"passwd"://g' | sed 's/,//g' | sed 's/"//g')

homePath="/home/$account"

#start controlProcess in background
cd $homePath/prj/node/VLC/dist
echo $passwd | sudo -S node controlModebus.js