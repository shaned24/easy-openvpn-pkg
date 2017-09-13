---
title: "FAQ"
table_of_contents: True
---

# FAQ

This section mainly covers frequently asked questions related to configuring and using easy-openvpn snap

## `Error opening configuration file: foo.ovpn` When running connect-server to connect openvpn server?

Problem possibly caused by lacking permission. When you encounter this problem,    
1. Please first check if you run the easy-openvpn.connect-server with sudo.  
2. As elaborated in [Installation / Launch openvpn client](installation.md), you need to connect home plug
   if you put the ovpn file to your HOME directory. Moreover, you need to change the owner of ovpn file to 
   root, otherwise you probably encounter the [dac_override denied](https://forum.snapcraft.io/t/docker-load-fails-with-permission-denied/1227/3)
   in snappy world.

## Why no internet access even after openvpn connection is established?

This means you probably didn't reroute traffic to right network interface.
The default nat device openvpn server relied on to route all traffic through openvpn is 'eth0'.
But when you connected to a wireless network, the active network interface should be changed to 'wlan0' or others.
You need to configure it accordingly before launching the openvpn server.
Please check it here for more details [Installation / Launch openvpn server](installation.md)

**NOTE:** Remember to reload the snap to take effect after you changed nat device.
