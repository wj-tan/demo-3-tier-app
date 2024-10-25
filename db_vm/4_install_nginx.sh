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
server {
    listen 80;
    server_name $SERVER_IP;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
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
