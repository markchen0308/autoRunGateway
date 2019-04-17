#!/bin/sh

#get account in config.json
account=$(grep -Po '"account":.*?[^\\]",' config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')

homePath="/home/$account"

cd $homePath/prj/node/autoRunGateway
#remove and copy config.json to VLC and express-iot
rm $homePath/prj/node/VLC/dist/config.json
rm $homePath/prj/node/express-iot-vlc/config.json
cp config.json $homePath/prj/node/VLC/dist/
cp config.json $homePath/prj/node/express-iot-vlc/

#stop system
cd $homePath/prj/node/autoRunGateway
sh stopSystem.sh

#sleep 2 second
sleep 2

#start system
cd $homePath/prj/node/autoRunGateway
sh startSystemBg.sh