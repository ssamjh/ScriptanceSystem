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
RAM="512M"
#
#How many slots should the server have.
SLOTS="50"
#
#The type of the server.
TYPE="HB"
#
#The type ID, this must be a different number for each type.
TYPEID="01"
#
##The ID of the server.
ID="2"
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
#Where is the dynamic folder located, this is where dynamic servers will be run in?
DIRDYNAMIC="$DIRBASE/dynamic"
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
/bin/echo -e "Location: $DIRDYNAMIC/$TYPE-$ID"
/bin/echo -e ""
/bin/echo -e "Starting the server in 5 seconds from NOW! Does something above look wrong? Press Ctrl-C to interrupt!\e[0m"
sleep 5
#
# SETUP
#
#Lets make sure the directory is clean!
rm -rf "$DIRDYNAMIC/$TYPE-$ID"
#
#And now let's create a new directory.
mkdir "$DIRDYNAMIC/$TYPE-$ID"
#
#Let's move to the server direcotry.
cd "$DIRDYNAMIC/$TYPE-$ID"
#
#Time to get Spigot!
cp "$DIRSPIGOT/spigot-$VER.jar" "$DIRDYNAMIC/$TYPE-$ID/"
#
#Now copy the global folder to this server.
cp -r "$DIRTEMPLATES/global/." "$DIRDYNAMIC/$TYPE-$ID/"
#
#And the template...
cp -r "$DIRTEMPLATES/$TYPE/." "$DIRDYNAMIC/$TYPE-$ID/"
#
# SPIGOT
#
java -server -Xmx$RAM -Dcom.mojang.eula.agree=true -jar spigot-$VER.jar --host $IP --port $PORT --max-players $SLOTS
echo "The server has been stopped, and will restart in 5 seconds. Press Ctrl-C to interrupt."
sleep 5
done;