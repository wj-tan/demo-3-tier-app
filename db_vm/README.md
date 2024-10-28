### Setup Instructions

1. Run the MongoDB installation script:
   ```bash
   sh ./1_install_mongo.sh
2. Run the Python installation script:
   ```bash
   sh ./2_install_python.sh
3. Set up the application folder:
   ```bash
   sh ./3_setup_app_folder.sh
4. Install Nginx:
   ```bash
   sh ./4_install_nginx.sh
5. Open the Nginx configuration file `/etc/nginx/sites-available/fastapi-mongodb-app` and modify the `user` `server_name` directive to include your DB IP or FQDN:
   ```nginx
   upstream app_server {
    server unix:/home/user/employee_db/run/gunicorn.sock fail_timeout=0;
   }
   server_name <DB IP/FQDN>;
   


