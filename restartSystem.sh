#!/bin/sh

account="mark"

homePath="/home/$account"

#stop system
cd $homePath/prj/node/autoRunGateway
sh stopSystem.sh

#sleep 2 second
sleep 2

#start system
cd $homePath/prj/node/autoRunGateway
sh startSystem.sh