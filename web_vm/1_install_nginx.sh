#!/bin/sh

#apk add nginx --no-cache
#rc-update add nginx default

sudo dnf install nginx
systemctl enable nginx

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
