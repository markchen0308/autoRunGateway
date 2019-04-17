#!/bin/sh




#get account in config.json
account=$(grep -Po '"account":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')
#get passwd in config.json
passwd=$(grep -Po '"passwd":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"passwd"://g' | sed 's/,//g' | sed 's/"//g')

homePath="/home/$account"

cd $homePath/prj/node/autoRunGateway
#remove and copy config.json to VLC and express-iot
rm -f $homePath/prj/node/VLC/dist/config.json
rm -f $homePath/prj/node/express-iot-vlc/config.json
cp config.json $homePath/prj/node/VLC/dist/
cp config.json $homePath/prj/node/express-iot-vlc/


#stop system
cd $homePath/prj/node/autoRunGateway
echo $passwd | sudo -S sh stopSystem.sh

#sleep 2 second
sleep 2

#start system
cd $homePath/prj/node/autoRunGateway
echo $passwd | sudo -S sh startSystemFg.sh