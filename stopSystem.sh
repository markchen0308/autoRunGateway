#!/bin/sh

#get passwd in config.json
account=$(grep -Po '"account":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"account"://g' | sed 's/,//g' | sed 's/"//g')
#get passwd in config.json
passwd=$(grep -Po '"passwd":.*?[^\\]",' ~/prj/node/autoRunGateway/config.json | sed 's/"passwd"://g' | sed 's/,//g' | sed 's/"//g')
#delete
echo $passwd | sudo -S pkill node