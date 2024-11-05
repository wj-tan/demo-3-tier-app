#!/bin/sh

mkdir /root/employee_app
mkdir /root/employee_app/logs
cp -r /root/demo-3-tier-app/app_vm/* /root/employee_app

# Open firewall required
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
