---
title: "Report a Bug"
table_of_contents: False
---

# Rebort a Bug

Bugs can be reported [here](https://bugs.launchpad.net/snappy-hwe-snaps/+filebug).

When submitting a bug report, please attach a copy of the system log of openvpn server:

```
$ journalctl --no-pager -u snap.easy-openvpn.easy-openvpn
```

And the output of the following three commands:

```
$ easy-openvpn.connect-server foo.ovpn
$ easy-openvpn.status
$ easy-openvpn.clients
```
