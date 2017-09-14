---
title: "Snap Configuration"
table_of_contents: False
---

# Snap Configuration

Besides the configuration offered by upstream, the easy-openvpn snap provides a 
simple set of snap configuration items which can be changed through the *snap set* system
command.  

The available configuration items are documented in the following sections.

## debug

The *debug* option allows running easy-openvpn subcommand in verbose logging mode.

Possible values are:

 * *0 (default):* disable verbose logging mode when runnning easy-openvpn subcommand 
 * *1:* enable verbose logging mode when runnning easy-openvpn subcommand.

Example:

```
$ snap set easy-openvpn debug=1
```

## nopasswd

The *nopasswd* option allows to generate private key without a passphrase during server setup.
Normally, people should always generate private key with a passphrase for security reasons.
This value is only used to setup an OpenVPN server in non-interactive mode for running spread test.

Possible values are:

 * *0 (default):* Disable passphrase-less mode. A passphrase is required to generate private key.
 * *1:* Enable passphrase-less mode. This will result in configuring server in non-interactive mode.

Example:

```
$ snap set easy-openvpn nopasswd=1
```

## natdevice


The *natdevice* option allows to specify the active network interafce for traffic rerouting on OpenVPN server.
If internet connection is over ethernet, you can skip natdevice setup since default natdevice value is 'eth0'.
While a wireless connection is established, you need to set it to 'wlan0' accordingly.
Note: This fits the scenario where people usually setup a wireless connection on ubuntu core at the first boot.

Possible values are:

 * *eth0 (default):* Default active network interface for ethernet connection.
 * *wlan0:* active network interface for wireless connection if you connect to wireless network.
           You need to change it to decent network interface name if you connect to different network.
          
Example:

```
$ snap set easy-openvpn natdevice=wlan0
```
