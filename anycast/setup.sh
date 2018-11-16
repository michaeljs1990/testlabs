#!/bin/bash

apt-get install -y quagga vim

# Setup files needed for quagga to start
touch /etc/quagga/bgpd.conf
touch /etc/quagga/zebra.conf
touch /etc/quagga/vtysh.conf

systemctl start zebra
systemctl start bgpd
