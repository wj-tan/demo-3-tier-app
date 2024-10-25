#!/bin/bash

# Install Nginx
echo "Installing Nginx..."
sudo apt update
sudo apt install -y nginx

# Get the server's IP address
SERVER_IP=$(hostname -I | awk '{print $1}')

# Create Nginx configuration for FastAPI
echo "Creating Nginx configuration..."
CONFIG_FILE="/etc/nginx/sites-available/fastapi"
sudo bash -c "cat > $CONFIG_FILE <<EOF
upstream app_server {
    server unix:/root/employee_db/run/gunicorn.sock fail_timeout=0;
}

server {
    listen 80;
    # add here the ip address of your server
    # or a domain pointing to that ip (like example.com or www.example.com)
    server_name $SERVER_IP;

    keepalive_timeout 5;
    client_max_body_size 4G;

    access_log /root/employee_db/logs/nginx-access.log;
    error_log /root/employee_db/logs/nginx-error.log;

    location / {

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;

        if (!-f $request_filename) {
            proxy_pass http://app_server;
            break;
        }
}
}

EOF"

# Enable the configuration
echo "Enabling the Nginx configuration..."
sudo ln -s /etc/nginx/sites-available/fastapi /etc/nginx/sites-enabled

# Test Nginx configuration
echo "Testing Nginx configuration..."
sudo nginx -t

# Restart Nginx
echo "Restarting Nginx..."
sudo systemctl restart nginx

echo "Nginx installation and configuration completed."
