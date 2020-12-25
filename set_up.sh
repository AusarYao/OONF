#!/bin/bash

sudo ip link set wlan1 down	#set network interface down to switch operation mode
sudo iw wlan1 set type ibss	#switch operation mode to ibss (ad-hoc mode)
sudo ip link set wlan1 up	#set network inerface up to activate it
sudo iw wlan1 ibss join mesh_test 2417 	#join/create a mesh netowrk with certain frequency (choose one with minimal interference)
					#check supported frequencies with iw list and see for the interface you are using.
					#ALL devices in the mesh network MUST have the same ssid and frequency

#Next assign a static ip address to the interface for mesh network (in my case wlan1)
# ip address add address/prefix_len broadcast + dev interface (https://wiki.archlinux.org/index.php/Network_configuration#Static_IP_address)
#remember to use different ip address for different device
