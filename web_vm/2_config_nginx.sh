#!/bin/bash

echo "Copying default.conf to /etc/nginx/"
cp /root/demo-3-tier-app/web_vm/default.conf /etc/nginx/http.d/default.conf

echo "Remember to update the /etc/nginx/http.d/default.conf with the correct IPs"

