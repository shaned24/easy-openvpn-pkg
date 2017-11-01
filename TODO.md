# TODO

## user/group management in strict mode
```
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 /sbin/ip addr add dev tun0 local 192.168.255.1 peer 192.168.255.2
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 /sbin/ip route add 192.168.254.0/24 via 192.168.255.2
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 /sbin/ip route add 192.168.255.0/24 via 192.168.255.2
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 setgid('nogroup') failed: Operation not permitted (errno=1)
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 Exiting due to fatal error
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 /sbin/ip route del 192.168.255.0/24
Apr  6 17:38:56 ubuntu kernel: [64687.436655] audit: type=1400 audit(1491471536.910:1323803): apparmor="DENIED" operation="capable" profile="snap.easy-openvpn.easy-openvpn" pid=122912 comm="openvpn" capability=6  capname="setgid"
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 /sbin/ip route del 192.168.254.0/24
Apr  6 17:38:56 ubuntu snap[122912]: Thu Apr  6 17:38:56 2017 Closing TUN/TAP interface
```
We disable user and group setup for openvpn server for the time being as an open bug can be found on launchpad. [lp#1606510](https://bugs.launchpad.net/snappy/+bug/1606510)

## generate some clients and test connection is working

# DONE
- figure out why iptables nat rules aren't allowed with firewall-control
  - need to snap connect :firewall-control, :network-control
- tun/tap access for openvpn in strict mode
  - read/write acccess to /dev/net/tun is allowed in snapd with network-control connected
- single command to set up server
  - please check easy-openvpn.setup command
- single command to create/revoke client ovpns
  - please check easy-openvpn.add-client command
