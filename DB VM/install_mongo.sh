#!/bin/sh

sudo apt-get install gnupg curl

curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

sudo apt-get update

sudo apt-get install -y mongodb-org

sudo systemctl daemon-reload
sudo systemctl start mongod
sudo systemctl enable mongod


# Import JSON data
# Replace "/home/user/employee_db" with the actual path to your data file
sudo mkdir /home/root/employee_db
DATA_FILE="/home/root/employee_db/MOCK_DATA.json"
if [ -f "$DATA_FILE" ]; then
  mongoimport --db=employees_DB --collection=employees --file="$DATA_FILE" --jsonArray
else
  echo "Data file $DATA_FILE not found. Skipping import."
fi

# Set unique constraints in MongoDB
mongosh <<EOF
use employees_DB
db.employees.createIndex({ "emp_id": 1 }, { unique: true })
db.employees.createIndex({ "first_name": 1, "last_name": 1 }, { unique: true })
EOF

echo "MongoDB setup and data import completed."

