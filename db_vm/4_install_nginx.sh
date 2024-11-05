#!/bin/bash

# Install Nginx

sudo dnf install -y nginx

sudo systemctl enable nginx

# Get the server's IP address
SERVER_IP=$(hostname -I | awk '{print $1}')
NGINX_CONF="/etc/nginx/nginx.conf"
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled
CONFIG_FILE_FOLDER="/etc/nginx/sites-available"

# Create Nginx configuration for FastAPI
echo "Copying Nginx configuration file..."

cp /root/demo-3-tier-app/db_vm/fastapi-mongodb-app $CONFIG_FILE_FOLDER/fastapi-mongodb-app

# Enable the configuration

# Open Firewall ports
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=8000/tcp
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload

# Use sed to replace 'user www-data;' with 'user root;'
sed -i 's/^user www-data;/user root;/' "$NGINX_CONF"

echo "Enabling the Nginx configuration..."
sudo ln -s $CONFIG_FILE_FOLDER/fastapi-mongodb-app /etc/nginx/sites-enabled/

# Test Nginx configuration
echo "Testing Nginx configuration..."
sudo nginx -t

# Restart Nginx
echo "Restarting Nginx..."
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Nginx installation and configuration completed."
