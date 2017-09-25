---
title: "OpenVPN client setup"
table_of_contents: True
---

# Generate client ovpn file

Firstly, you need to add a client credential on the server side and copy the generated ovpn file to the clients.

    $ sudo easy-openvpn.add-client foo > foo.ovpn

Most users simply copy the .ovpn client config file to their home directory and
connect to the server directly. Unfortunately, the connection won't be established
due to the strict confinement. You need to connect to the home plug as follows:

    $ snap connect easy-openvpn:home :home

# Launch OpenVPN client

On the client side, please connect to your VPN server with the generated .ovpn file.

    $ sudo easy-openvpn.connect-server foo.ovpn

Once a connection is established, the output should end with the `Initialization Sequence Completed` message.
