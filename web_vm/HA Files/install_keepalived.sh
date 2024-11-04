#!/bin/sh

apk add keepalived
mkdir /etc/keepalived
#rc-update add keepalived default
systemctl enable keepalived

sudo firewall-cmd --permanent --add-protocol=vrrp
sudo firewall-cmd --reload
