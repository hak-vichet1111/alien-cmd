file: /etc/network/interfaces

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
#allow-hotplug ens18
auto ens19
iface ens19 inet static
        address 192.168.100.225/23
        gateway 192.168.101.1

auto ens18
iface ens18 inet static
        address 192.168.50.124/24
        gateway 192.168.50.1