#!/bin/sh

#check port 
#sudo lsof -i | grep TCP
#sudo kill pidnumber

#remeber change the pswd as you administration account password
account="mark"
passwd=mark

homePath="/home/$account"

#start controlProcess in background
cd $homePath/prj/node/VLC/dist
echo $passwd | sudo -S node controlProcess.js  &


#sleep 2 second
sleep 2

#start web server in background
cd $homePath/prj/node/express-iot-vlc
echo $passwd | sudo -S node bin/www &

#sleep 1 second
sleep 1

#start modbus control in background
cd $homePath/prj/node/VLC/dist
echo $passwd | sudo -S node controlModebus.js &


