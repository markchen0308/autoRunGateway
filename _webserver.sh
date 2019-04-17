#!/bin/sh

#get account in config.json
account=$(grep -Po '"account":.*?[^\\]",' config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')

#get passwd in config.json
passwd=$(grep -Po '"passwd":.*?[^\\]",' config.json | sed 's/"passwd"://g' | sed 's/,//g' | sed 's/"//g')

homePath="/home/$account"
#start web server in background
cd $homePath/prj/node/express-iot-vlc
echo $passwd | sudo -S node bin/www 
