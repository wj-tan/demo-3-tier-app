### Setup Instructions

1. Run the Nginx installation script:
   ```bash
   sh ./1_install_nginx.sh
2. Run thi script to move the nginx default.conf file :
   ```bash
   sh ./2_config_nginx.sh
3. Open the Nginx configuration file `/etc/nginx/http.d/default.conf` and modify the `server_name` and `proxy_pass`:
   ```nginx
    server_name <web-server-ip or fqdn>;
    proxy_pass http://<app-server-ip or fqdn>:8080;
4. Restart nginx:
   ```bash
   rc-service nginx restart
