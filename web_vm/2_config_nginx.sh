#!/bin/bash

echo "Copying default.conf to /etc/nginx/"
cp /root/demo-3-tier-app/web_vm/default.conf /etc/nginx/http.d/default.conf

echo "Remember to update the /etc/nginx/http.d/default.conf with the correct IPs"

sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo setsebool -P httpd_can_network_connect 1
