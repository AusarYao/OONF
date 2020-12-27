#!/bin/bash

sudo ifconfig wlan1 down					#set wlan1 (or your designated mesh network interface) down to switch operation mode
sudo iwconfig wlan1 channel 1 essid mesh_test mode ad-hoc freq 2.417GHz	#switch operation mode to ad-hoc and create a mesh network
sudo  ifconfig wlan1 up						#set network inerface up to activate it
#sudo ifconfig wlan1 10.10.0.1 netmask 255.255.255.0	 	#assign unique ip address for each device
