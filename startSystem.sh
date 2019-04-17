#!/bin/sh

#check port 
#sudo lsof -i | grep TCP
#sudo kill pidnumber

#remeber change the pswd as you administration account password
account="mark"
passwd=mark

homePath="/home/$account"

destPidCollect="$homePath/prj/node/autoRunGateway/pidCollect.txt"

cd ~/prj/node/VLC/dist
echo $passwd | sudo -S node controlProcess.js  &


#sleep 2 second
sleep 2



#start web server
cd ~/prj/node/express-iot-vlc
echo $passwd | sudo -S node bin/www &

#sleep 1 second
sleep 1
#start modbus control
cd ~/prj/node/VLC/dist
echo $passwd | sudo -S node controlModebus.js


#get pid and save to file
#pgrep node | xargs echo > "$destPidCollect"
#pgrep node | xargs  >> "$destPidCollect"

