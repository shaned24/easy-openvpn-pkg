# Easy OpenVPN

This project builds a snap for easy OpenVPN setup and installation. It was
designed to be deployed with as little configuration & setup as possible for
spot deployment of secure yet disposable OpenVPN instances.

# Status

NOT WORKING yet. See [TODO](TODO.md) for current issues.

# Deploy

    sudo snap install easy-openvpn
    sudo snap connect easy-openvpn:network-control ubuntu-core:network-control
    sudo snap connect easy-openvpn:firewall-control ubuntu-core:firewall-control
