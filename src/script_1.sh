# para config

# eonwe yang ini atau 
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.223.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.223.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 192.223.3.1
    netmask 255.255.255.0


## switch 1
# Earendil
auto eth0
iface eth0 inet static
    address 192.223.1.2
    netmask 255.255.255.0
    gateway 192.223.1.1

# Elwing 
auto eth0
iface eth0 inet static
    address 192.223.1.3
    netmask 255.255.255.0
    gateway 192.223.1.1

## switch 2
# cirdan 
auto eth0
iface eth0 inet static
    address 192.223.2.2
    netmask 255.255.255.0
    gateway 192.223.2.1

# Elrond
auto eth0
iface eth0 inet static
    address 192.223.2.3
    netmask 255.255.255.0
    gateway 192.223.2.1

# Maglor
auto eth0
iface eth0 inet static
    address 192.223.2.3
    netmask 255.255.255.0
    gateway 192.223.2.1

## switch 3
# Sirion
auto eth0
iface eth0 inet static
    address 192.223.3.2
    netmask 255.255.255.0
    gateway 192.223.3.1

## switch 4
# Tirion
auto eth0
iface eth0 inet static
    address 192.223.3.3
    netmask 255.255.255.0
    gateway 192.223.3.1

# Valmar
auto eth0
iface eth0 inet static
    address 192.223.3.4
    netmask 255.255.255.0
    gateway 192.223.3.1

# Lindon
auto eth0
iface eth0 inet static
    address 192.223.3.5
    netmask 255.255.255.0
    gateway 192.223.3.1

# Vingilot
auto eth0
iface eth0 inet static
    address 192.223.3.6
    netmask 255.255.255.0
    gateway 192.223.3.1