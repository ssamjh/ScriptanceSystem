#!/bin/bash
#
while true; do
clear
#
# SETTINGS
#
#
#How much ram should we give the server.
RAM="512M"
#
#The type of the server.
TYPE="PX"
#
##The ID of the server.
ID="1"
#
#The name of the server.
SERVERNAME="$TYPE-$ID"
#
# FOLDERS
#
#Where is the instance system located?
DIRBASE="/home/mc/mineswine"
#
#Where is the static server folder located, this is where static servers will be run in?
DIRSTATIC="$DIRBASE/servers"
#
#This just displays the server information to console for two seconds.
/bin/echo -e "\e[91mInstance System\e[0m"
/bin/echo -e "Proxy Settings"
/bin/echo -e "Type: $TYPE"
/bin/echo -e "RAM: $RAM"
/bin/echo -e "Server Name: $SERVERNAME"
/bin/echo -e "Location: $DIRSTATIC/$TYPE-$ID"
/bin/echo -e ""
/bin/echo -e "Starting the proxy in 5 seconds from NOW! Does something above look wrong? Press Ctrl-C to interrupt!\e[0m"
sleep 5
#
# SETUP
#
#Let's move to the server direcotry.
cd "$DIRSTATIC/$TYPE-$ID"
#
#
# SPIGOT
#
java -server -Xmx$RAM -jar BungeeCord.jar
/bin/echo -e "The proxy has been stopped, and will restart in 5 seconds. Press Ctrl-C to interrupt."
sleep 5
done;