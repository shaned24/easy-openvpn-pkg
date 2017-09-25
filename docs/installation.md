---
title: "Installation"
table_of_contents: True
---

# Installation

To install the latest stable release of easy-openvpn from the Ubuntu store:

```
 $ snap install easy-openvpn
```

All necessary plugs and slots will be automatically connected upon
installation, except the home plug. You can verify this with:

```
$ snap interfaces
Slot                       Plug
[...]
:network                   easy-openvpn
:network-bind              easy-openvpn
[...]
:firewall-control          easy-openvpn
:network-control           easy-openvpn
```

You probably need to connect the home plug manually if you copy the client
ovpn file to your home directory and connect the client to server with it.

```
$ snap connect easy-openvpn:home :home
```
