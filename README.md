# Easy OpenVPN

This project builds a snap for easy OpenVPN setup and installation. It was
designed to be deployed with as little configuration & setup as possible for
spot deployment of secure yet disposable OpenVPN instances.

# Status

We disable user and group setup for OpenVPN server for the time being as an
open bug can be found on launchpad. [lp#1606510](https://bugs.launchpad.net/snappy/+bug/1606510).
Adding [user and group management](https://forum.snapcraft.io/t/multiple-users-and-groups-in-snaps/1461/2) support is on the roadmap of snpad. We'll support it accordingly when the feature land.See [TODO](TODO.md) for current issues.

# Operate

Commands subject to change as I refine things, but here goes:

## Install

    sudo snap install easy-openvpn

## Connect two necessary plugs as they're not auto-connected by default:

    sudo snap connect easy-openvpn:network-control  :network-control
    sudo snap connect easy-openvpn:firewall-control :firewall-control

## Configure

    sudo easy-openvpn.setup -u udp://<public ip>

You'll be prompted to set a passphrase for your CA. This passphrase will be
used to create clients later.

## Start

	sudo service snap.easy-openvpn.easy-openvpn start

From snapd 2.26.9, snapd can currently take connections of interfaces dynamically
and update the mount namespaces of the snap in-place, without any processes
restarting or any other change after connecting interfaces above.  But to be safe,
we could reload the snap manually with the following commands.

    sudo disable easy-openvpn
    sudo enable easy-openvpn

## Use

	sudo easy-openvpn.add-client foo > foo.ovpn

Add a client and enter the same passphrase you set during setup above. Use the
.ovpn file to connect to your VPN server.

## Manage

### List clients

	sudo easy-openvpn.clients

### Show client ovpn

	sudo easy-openvpn.show-client foo

### Tail the log

	sudo easy-openvpn.status

## Testing

We rely on spread (https://github.com/snapcore/spread) to run full-system test on Ubuntu Core 16. A utility script (run-spread-test.sh) being used to launch the spread test can be found in this project.

Firstly, install ubuntu-image tool since we need to create a custom Ubuntu Core image during test preparation.

      $ sudo snap install --beta --classic ubuntu-image

Secondly, install qemu-kvm package since we use it as the backend to run the spread test.

      $ sudo apt install qemu-kvm

Meanwhile, you need a classic-mode supported spread binary to launch kvm from its context. You can either build the spread from this [branch](https://github.com/rmescandon/spread/tree/snap-as-classic) or download the spread snap package [here](http://people.canonical.com/~gary-wzl77/spread_2017.05.24_amd64.snap).

      $ sudo snap install --classic --dangerous spread_2017.05.24_amd64.snap

All set, you can build the easy-openvpn snap locally in advance and then execute spread test with the following commands.
      $ snapcraft
      $ ./run-tests.sh

In comparison with local build, you can also specify --test-from-channel to fetch the snap from the specific channel of the store. The snap from `candidate` channel is used by default as test target if `--channel` option is not specified.

      $ ./run-tests.sh --test-from-channel --channel=candidate

In order to execute an individual spread test, please run the following command

      $ spread spread/main/installation

This will run test case under spread/main/installation folder.
You can specify the `SNAP_CHANNEL` environment variable to install snap from a specific channel for the testing as well.

      $ SNAP_CHANNEL=candidate spread spread/main/update_policy

