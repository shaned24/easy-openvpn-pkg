---
title: "OpenVPN server setup"
table_of_contents: True
---

# Enable IP forwarding

First we need to be sure that IP forwarding is enabled.   
**Note:** On Ubuntu Core, IP forwarding is disabled by default.

    $ sudo sysctl -w net.ipv4.ip_forward=1

# Set NAT device as needed

If the Internet connection is over ethernet, you can skip NAT device setup since the default NAT device value
is 'eth0'. While a wireless connection is established, you need to set it to 'wlan0' accordingly.  
**Note:** This fits the scenario where people usually set up a wireless connection via console-conf
on Ubuntu Core during the first boot.

    $ sudo snap set easy-openvpn natdevice=wlan0

# Launch OpenVPN server

Set up an OpenVPN server with a host machine IP address:

    $ sudo easy-openvpn.setup -u udp://<public ip>

You'll be prompted to set a passphrase for your CA. This passphrase will be used to create clients later.  
Then start an OpenVPN server with the following command:

    $ sudo service snap.easy-openvpn.easy-openvpn start

Beginning with snapd 2.26.9, snapd can currently take connections of interfaces dynamically
and update the mount namespaces of the snap in-place without any processes
restarting or any other change after connecting interfaces above. But to be safe,
the snap can be reloaded manually with the following commands:

    $ sudo disable easy-openvpn
    $ sudo enable easy-openvpn
