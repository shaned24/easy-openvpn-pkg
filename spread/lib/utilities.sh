#!/bin/bash

SERVICE_UNIT="snap.easy-openvpn.easy-openvpn"

SERVER_IP=$(hostname  -I | cut -f1 -d' ')

wait_for_systemd_service() {
	while ! systemctl status $1 ; do
		sleep 1
	done
	sleep 1
}
