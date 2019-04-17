#!/bin/sh

#check port 
#sudo lsof -i | grep TCP
#sudo kill pidnumber

#get account in config.json
account=$(grep -Po '"account":.*?[^\\]",' config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')

homePath="/home/$account"

cd $homePath/prj/node/autoRunGateway
#remove and copy config.json to VLC and express-iot
rm $homePath/prj/node/VLC/dist/config.json
rm $homePath/prj/node/express-iot-vlc/config.json
cp config.json $homePath/prj/node/VLC/dist/
cp config.json $homePath/prj/node/express-iot-vlc/

#start controlProcess in background
#cd $homePath/prj/node/VLC/dist
#echo $passwd | sudo -S node controlProcess.js  &
cd $homePath/prj/node/autoRunGateway
sh _controlProcess.sh &

#sleep 2 second
sleep 2

#start web server in background
#cd $homePath/prj/node/express-iot-vlc
#echo $passwd | sudo -S node bin/www &
cd $homePath/prj/node/autoRunGateway
sh _webserver.sh &

#sleep 1 second
sleep 1

#start modbus control in background
#cd $homePath/prj/node/VLC/dist
#echo $passwd | sudo -S node controlModebus.js &
#cd $homePath/prj/node/autoRunGateway
cd $homePath/prj/node/autoRunGateway
sh _modbusControl.sh &

