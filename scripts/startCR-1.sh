#!/bin/bash
#
while true; do
clear
#
# SETTINGS
#
#The version of Spigot we should run. Must exist in the spigot folder.
VER="1.12.2"
#
#How much ram should we give the server.
RAM="2048M"
#
#How many slots should the server have.
SLOTS="200"
#
#The type of the server.
TYPE="CR"
#
#The type ID, this must be a different number for each type.
TYPEID="06"
#
##The ID of the server.
ID="1"
#
#The name of the server.
SERVERNAME="$TYPE-$ID"
#
#The IP address.
IP="127.0.0.1"
#
#The port that the server uses, this is automatic, ignore it.
PORT="8$TYPEID$ID"
#
# FOLDERS
#
#Where is the instance system located?
DIRBASE="/path/to/scriptance"
#
#Where is the static server folder located, this is where static servers will be run in?
DIRSTATIC="$DIRBASE/servers"
#
#Where should we fetch the templates from?
DIRTEMPLATES="$DIRBASE/templates"
#
#Where should get the Spigot jar from?
#
DIRSPIGOT="$DIRBASE/templates/spigot"
#
#This just displays the server information to console for two seconds.
/bin/echo -e "\e[91mInstance System\e[0m"
/bin/echo -e "Server Settings"
/bin/echo -e "Type: $TYPE"
/bin/echo -e "RAM: $RAM"
/bin/echo -e "Version: $VER"
/bin/echo -e "Slots: $SLOTS"
/bin/echo -e "IP and Port: $IP:$PORT"
/bin/echo -e "Server Name: $SERVERNAME"
/bin/echo -e "Location: $DIRSTATIC/$TYPE-$ID"
/bin/echo -e ""
/bin/echo -e "Starting the server in 5 seconds from NOW! Does something above look wrong? Press Ctrl-C to interrupt!\e[0m"
sleep 5
#
# SETUP
#
#Let's move to the server direcotry.
cd "$DIRSTATIC/$TYPE-$ID"
#
#Time to get Spigot!
cp "$DIRSPIGOT/spigot-$VER.jar" "$DIRSTATIC/$TYPE-$ID/"
#
#Now copy the global folder to this server.
cp -r "$DIRTEMPLATES/global/." "$DIRSTATIC/$TYPE-$ID/"
#
#
# SPIGOT
#
java -server -Xmx$RAM -Dcom.mojang.eula.agree=true -jar spigot-$VER.jar --host $IP --port $PORT --max-players $SLOTS
echo "The server has been stopped, and will restart in 5 seconds. Press Ctrl-C to interrupt."
sleep 5
done;