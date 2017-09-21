---
title: Available Commands
table_of_contents: true
---

# Available Commands

The easy-openvpn snap is developed based on OpenVPN. OpenVPN itself
provides a lot of options to configure servers and clients. In order to make life easier
for end users to deploy an OpenVPN server, the easy-openvpn snap offers a few command line tools which cover
most commonly used scenarios to manage to the OpenVPN service, such as the setup server, create/revoke
client ovpns and so on. This section walks you through a brief introduction to each command.

## easy-openvpn.setup 

The *easy-openvpn.setup* command helps to quickly set up an OpenVPN server.
It offers a bunch of arguments to set up an OpenVPN server.

``` bash
Usage: easy-openvpn.setup [-d]
          -u SERVER_PUBLIC_URL
          [-e EXTRA_SERVER_CONFIG ]
          [-E EXTRA_CLIENT_CONFIG ]
          [-f FRAGMENT ]
          [-n DNS_SERVER ...]
          [-s SERVER_SUBNET]
        
optional arguments:
    -2    Enable two factor authentication using Google Authenticator.
    -a    Authenticate  packets with HMAC using the given message digest algorithm (auth).
    -b    Disable 'push block-outside-dns'
    -c    Enable client-to-client option
    -C    A list of allowable TLS ciphers delimited by a colon (cipher).
    -d    Disable default route
    -D    Do not push dns servers
    -k    Set keepalive. Default: '10 60'
    -m    Set client MTU
    -N    Configure NAT to access external server network
    -t    Use TAP device (instead of TUN device)
    -T    Encrypt packets with the given cipher algorithm instead of the default one (tls-cipher).
    -z    Enable comp-lzo compression.
```

And the easiest way to set up an OpenVPN server is as follows:

```
$ easy-openvpn.setup -u udp://server_public_ip_address
```

## easy-openvpn.add-client

The *easy-openvpn.add-client* command helps to add a user to OpenVPN server.
The output for this command contains a piece of user configuration file(ovpn) which can be used when 
connecting to the OpenVPN server with the OpenVPN client.

```
$ easy-openvpn.add-client foo > foo.ovpn
```

## easy-openvpn.clients

The *easy-openvpn.clients* command helps to view the clients list. The list records a client's name, 
start and end time of connection establishment, as well as client's status.

```
$ easy-openvpn.clients
```

## easy-openvpn.revoke-client

The *easy-openvpn.revoke-client* command helps to revoke a client credentials.  
**NOTE**: even if a client is revoked, the relevant information is still kept in the client list.
You are not able to create another client with the same client name.

```
$ easy-openvpn.revoke-client foo
```

## easy-openvpn.show-client

The *easy-openvpn.show-client* command helps to show a client's credentials (ovpn).

```
$ easy-openvpn.show-client foo
```


## easy-openvpn.connect-server

The *easy-openvpn.connect-server* command helps to establish an OpenVPN connection.
It uses an .ovpn file as client credentials to connect to a remote OpenVPN server.

```
$ easy-openvpn.connect-server foo.ovpn
```

## easy-openvpn.status

The *easy-openvpn.status* command helps to show the OpenVPN server's current status.
The output includes OpenVPN the client list, routing tables and global stats.

```
$ easy-openvpn.status
```

## easy-openvpn.help

The *easy-openvpn.help* command helps to view all snap-specific configurations.

```
$ easy-openvpn.help
```
