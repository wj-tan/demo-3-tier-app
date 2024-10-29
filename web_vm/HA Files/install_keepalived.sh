#!/bin/sh

apk add keepalived
mkdir /etc/keepalived
#rc-update add keepalived default
systemctl enable keepalived