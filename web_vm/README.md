### Setup Instructions

1. Run the Nginx installation script:
   ```bash
   sh ./1_install_nginx.sh
2. Run thi script to move the nginx default.conf file :
   ```bash
   sh ./2_config_nginx.sh
3. 5. Open the Nginx configuration file `/etc/nginx/http.d/default.conf` and modify the `user` `server_name` directive to include your DB IP or FQDN:
   ```nginx
    server_name <web-server-ip or fqdn>;
   http://<app-server-ip or fqdn>:8080;
