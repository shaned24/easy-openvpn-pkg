# TODO

## tun/tap access for openvpn in strict mode
```
Sep 03 11:11:16 zeugmatic ubuntu-core-launcher[14807]: Sat Sep  3 11:11:16 2016 Socket Buffers: R=[212992->212992] S=[212992->212992]
Sep 03 11:11:16 zeugmatic ubuntu-core-launcher[14807]: Sat Sep  3 11:11:16 2016 ROUTE_GATEWAY 192.168.88.1/255.255.255.0 IFACE=wlp3s0 HWADDR=3c:a9:f4:56:47:dc
Sep 03 11:11:16 zeugmatic ubuntu-core-launcher[14807]: Sat Sep  3 11:11:16 2016 ERROR: Cannot open TUN/TAP dev /dev/net/tun: Permission denied (errno=13)
Sep 03 11:11:16 zeugmatic ubuntu-core-launcher[14807]: Sat Sep  3 11:11:16 2016 Exiting due to fatal error
Sep 03 11:11:16 zeugmatic kernel: audit: type=1400 audit(1472919076.137:96): apparmor="DENIED" operation="open" profile="snap.easy-openvpn.easy-openvpn" name="/dev/net/tun" pid=14807 comm="openvpn" requested_mask=
Sep 03 11:11:16 zeugmatic systemd[1]: snap.easy-openvpn.easy-openvpn.service: Main process exited, code=exited, status=1/FAILURE
Sep 03 11:11:16 zeugmatic systemd[1]: snap.easy-openvpn.easy-openvpn.service: Unit entered failed state.
Sep 03 11:11:16 zeugmatic systemd[1]: snap.easy-openvpn.easy-openvpn.service: Failed with result 'exit-code'.
```

## generate some clients and test connection is working

## simplify things further
- single command to set up server
- single command to create/revoke client ovpns

# DONE
- figure out why iptables nat rules aren't allowed with firewall-control
  - need to snap connect :firewall-control, :network-control

