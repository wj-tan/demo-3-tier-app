#!/bin/sh

cd /root/demo-3-tier-app/db_vm
sudo apt install -y python3 python3-pip

: '
# Rhel version
sudo dnf install -y python3
sudo dnf install -y python3-pip
'

pip3 install -r requirements.txt
