---
title: "Snap Configuration"
table_of_contents: False
---

# Snap Configuration

Besides the configuration offered by upstream, the easy-openvpn snap provides a 
simple set of snap configuration items that can be changed through the *snap set* system
command.  

The available configuration items are documented in the following sections.

## debug

The *debug* option allows running easy-openvpn subcommands in verbose logging mode.

Possible values are:

 * *0 (default):* disable verbose logging mode when runnning easy-openvpn subcommands
 * *1:* enable verbose logging mode when runnning easy-openvpn subcommands

Example:

```
$ snap set easy-openvpn debug=1
```

## nopasswd

The *nopasswd* option allows a user to generate private key without a passphrase during server setup.
Normally, user should always generate private key with a passphrase for security reasons.
This value is only used to setup an OpenVPN server in non-interactive mode for running spread test.

Possible values are:

 * *0 (default):* Disable passphrase-less mode. A passphrase is required to generate private key
 * *1:* Enable passphrase-less mode. This will result in configuring server in non-interactive mode

Example:

```
$ snap set easy-openvpn nopasswd=1
```

## natdevice


The *natdevice* option allows to specify the active network interface for traffic rerouting on an OpenVPN server.
If the Internet connection is over ethernet, you can skip natdevice setup since the default natdevice value is 'eth0'.
While a wireless connection is established, you need to set it to 'wlan0' accordingly.
Note: This fits the scenario where users typically set up a wireless connection on Ubuntu Core at the first boot.

Possible values are:

 * *eth0 (default):* Default active network interface for ethernet connection
 * *wlan0:* active network interface for a wireless connection if you connect to wireless network
           You need to change it to decent network interface name if you connect to different network
          
Example:

```
$ snap set easy-openvpn natdevice=wlan0
```
