#!/bin/bash

# Add two addresses that we will use for our anycast route
ip addr add 192.168.50.1/24 dev lo
ip addr add 192.168.60.1/24 dev lo

eth1ip=$(ip addr show eth1 | grep -Po 'inet \K[\d.]+')

cat > /etc/quagga/bgpd.conf <<EOF
!
! Zebra configuration saved from vty
!   2018/11/14 06:15:41
!
router bgp 200
 bgp router-id $eth1ip
 redistribute kernel
 redistribute connected
 neighbor 10.10.12.101 remote-as 100
!
 address-family ipv6
 exit-address-family
 exit
!
line vty
!
EOF

systemctl restart bgpd
