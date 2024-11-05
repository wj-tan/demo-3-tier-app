#!/bin/bash

# Install keepalived
dnf install keepalived -y
systemctl enable keepalived

# Allow VRRP protocol
firewall-cmd --permanent --add-protocol=vrrp
firewall-cmd --reload

# Allow Multicast Traffic for VRRP
#sudo firewall-cmd --permanent --new-zone=multicast
#sudo firewall-cmd --permanent --zone=multicast --add-source=224.0.0.18
#sudo firewall-cmd --permanent --zone=multicast --add-protocol=vrrp

