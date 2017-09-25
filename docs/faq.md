---
title: "FAQ"
table_of_contents: True
---

# FAQ

This section covers frequently asked questions related to configuring and using the easy-openvpn snap.

## Why do I get the error `Error opening configuration file: foo.ovpn` when running connect-server to connect to the OpenVPN server?

The problem is possibly caused by insufficient permissions. When you encounter this problem:    
1. Please first check if you ran the easy-openvpn.connect-server with sudo.  
2. As elaborated in [OpenVPN Client Setup](openvpn-client-setup.md), you need to connect the home plug
   if you put the ovpn file into your HOME directory. Moreover, you need to change the owner of the ovpn file to 
   root, otherwise you will probably encounter the following issue: [dac_override denied](https://forum.snapcraft.io/t/docker-load-fails-with-permission-denied/1227/3)

## Why no Internet access even after a connection to OpenVPN is established?

This means you probably didn't reroute traffic to the right network interface.
The default NAT device OpenVPN server relies on to route all traffic through OpenVPN is 'eth0'.
When you connected to a wireless network, the active network interface should have been changed to 'wlan0' or others.
You need to configure it accordingly before launching the OpenVPN server.
Please check here for more details [OpenVPN Server Setup](openvpn-server-setup.md)

**NOTE:** Remember to reload the snap to take effect after you changed NAT device.
