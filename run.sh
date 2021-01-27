#!/bin/bash

#Rember to check your wifi dongle id!!!! Not always on wlan1 or wlan0
if [ "$#" -ne 1 ]; then
	echo "Illegal number of parameters: specifiy network interface"
	exit
fi

#You need to create a node_id file that specifies a unqiue ID for node
if test ! -f "./build/node_id"; then
	echo "You need to create ./build/node_id file that specifies a unqiue ID for node"
	exit
fi

read -r id < "./build/node_id"
echo """
[global]
        fork            no

[olsrv2]
        lan             10.10.0.$id/24

[interface=$1]
""" > ./build/config
#Remember to check your wifi interface id, I would suggest using at least
#one interface for Internet connection, get an additional wifi dongle.
sudo ifconfig $1 down					
#set wlan1 (or your designated mesh network interface) down to switch operation mode
sudo iwconfig $1 mode ad-hoc channel 7 freq 2.417GHz essid mesh_test
#switch operation mode to ad-hoc and create a mesh network
sudo  ifconfig $1 up						
#set network inerface up to activate it
sudo ifconfig $1 10.10.0.$id netmask 255.255.255.0	 	
#assign unique ip address for each device in /build/node_id file (first line)
sudo ./build/olsrd2_dynamic --load ./build/config
