# Easy OpenVPN

This project builds a snap for easy OpenVPN setup and installation. It was
designed to be deployed with as little configuration & setup as possible for
spot deployment of secure yet disposable OpenVPN instances.

# Status

Requires --devmode :( See [TODO](TODO.md) for current issues. Consider this
currently experimental quality.

# Operate

Commands subject to change as I refine things, but here goes:

## Install

    sudo snap install easy-openvpn --edge --devmode

## Configure

    sudo easy-openvpn.setup -u udp://<public ip>

You'll be prompted to set a passphrase for your CA. This passphrase will be
used to create clients later.

## Start

	sudo service snap.easy-openvpn.easy-openvpn start

## Use

	sudo service snap.easy-openvpn.add-client foo > foo.ovpn

Enter the same passphrase you set during setup above. Use the .ovpn file to
connect to your VPN server.

## Manage

### List clients

	sudo easy-openvpn.clients

### Show client ovpn

	sudo easy-openvpn.show-client foo

### Tail the log

	sudo easy-openvpn.status

