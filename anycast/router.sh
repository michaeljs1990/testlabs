#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward

cat > /etc/quagga/bgpd.conf <<EOF
!
! Zebra configuration saved from vty
!   2018/11/16 05:15:45
!
router bgp 100
 bgp router-id 10.10.12.101
 bgp bestpath as-path multipath-relax
 network 192.168.50.0/24
 redistribute kernel
 redistribute connected
 neighbor 10.10.12.102 remote-as 200
 neighbor 10.10.12.103 remote-as 200
 maximum-paths 2
!
 address-family ipv6
 exit-address-family
 exit
!
line vty
!
EOF

systemctl restart bgpd
