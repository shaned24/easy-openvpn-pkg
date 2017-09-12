---
title: "Configuration"
table_of_contents: True
---

# Launch openvpn server

Enable IP forwarding firstly. Note: On ubuntu core, IP forwarding is disabled by default.

    $ sudo sysctl -w net.ipv4.ip_forward=1

If internet connection is over ethernet, you can skip natdevice setup since default natdevice value
is 'eth0'. While a wireless connection is established, you need to set it to 'wlan0' accordingly.
Note: This fits the scenario where people usually setup a wireless connection via console-conf
on ubuntu core at the first boot.

    $ sudo snap set easy-openvpn natdevice=wlan0

Setup an openvpn server with host machine IP address:

    $ sudo easy-openvpn.setup -u udp://<public ip>

You'll be prompted to set a passphrase for your CA. This passphrase will be used to create clients later.
Start an openvpn server with the following command:

    $ sudo service snap.easy-openvpn.easy-openvpn start

Beginning with snapd 2.26.9, snapd can currently take connections of interfaces dynamically
and update the mount namespaces of the snap in-place without any processes
restarting or any other change after connecting interfaces above. But to be safe,
we could reload the snap manually with the following commands:

    $ sudo disable easy-openvpn
    $ sudo enable easy-openvpn

# Launch openvpn client

You need to add a client on the server side and copy the generated ovpn file to your client devices.

    $ sudo easy-openvpn.add-client foo > foo.ovpn

Most people simply copy .ovpn client config file to home directory and
connect to server directly. Unfortunately, connection won't be established 
due to the strict confinment. And you need to connect to home plug firstly.

```
$ snap connect easy-openvpn:home :home
```

On the client side, please use the .ovpn file to connect to your VPN server.

    $ sudo easy-openvpn.connect-server *.ovpn

# Default Configuration
Easy-openvpn comes with default configuration after a fresh snap installation.
You can run the following command to view the relevant settings.

```  
$ sudo easy-openvpn.help
```

You can also change the settings by running:
```  
$ snap set easy-openvpn <key name>='<key value>'
```

For certain specific configurations i.e. natdeivce, they would not take 
effect until you reload the snap. We could reload the snap manually with 
the following commands:
```  
$ sudo disable easy-openvpn
$ sudo enable easy-openvpn
```

| Name | Value | Description | 
|------|-------|-------------|
| **debug** | 0 | Enable debug mode in OpenVPN server if it's set to 1.|
| **nopasswd** | 0 | Enable generating private key without a passphrase during server setup if it's set to 1. |
| **natdevice** | eth0 | Support to specify nat device, typically it could be eth0(default) or wlan0 if you connect to server over wireless connection|

