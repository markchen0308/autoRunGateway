#!/bin/sh

#get passwd in config.json
passwd=$(grep -Po '"passwd":.*?[^\\]",' config.json | sed 's/"passwd"://g' | sed 's/,//g' | sed 's/"//g')

#delete
echo $passwd | sudo -S pkill node