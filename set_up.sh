#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Illegal number of parameters: specifiy network interface"
	exit
fi
#Remember to check your wifi interface id, I would suggest using wlan0 
#for Internet access, get an additional wifi dongle on wlan1
sudo ifconfig $1 down					
#set wlan1 (or your designated mesh network interface) down to switch operation mode
sudo iwconfig $1 channel 1 mode ad-hoc freq 2.417GHz essid mesh_test
#switch operation mode to ad-hoc and create a mesh network
sudo  ifconfig $1 up						
#set network inerface up to activate it
read -r id < "node_id"
sudo ifconfig $1 10.10.0.$id netmask 255.255.255.0	 	
#assign unique ip address for each device in /build/node_id file (first line)
