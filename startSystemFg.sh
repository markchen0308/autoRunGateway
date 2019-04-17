#!/bin/sh

#check port 
#sudo lsof -i | grep TCP
#sudo kill pidnumber


#get account in config.json
account=$(grep -Po '"account":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')
homePath="/home/$account"

cd $homePath/prj/node/autoRunGateway
#remove and copy config.json to VLC and express-iot
rm $homePath/prj/node/VLC/dist/config.json
rm $homePath/prj/node/express-iot-vlc/config.json
cp config.json $homePath/prj/node/VLC/dist/
cp config.json $homePath/prj/node/express-iot-vlc/

#open new terminal and start controlProcess 
cd $homePath/prj/node/autoRunGateway
gnome-terminal --tab --title=controlProcess -e 'sh _controlProcess.sh'

#sleep 2 second
sleep 2

cd $homePath/prj/node/autoRunGateway
gnome-terminal --tab --title=webserver -e 'sh _webserver.sh'

cd $homePath/prj/node/autoRunGateway
gnome-terminal --tab --title=modbusControl -e 'sh _modbusControl.sh'
