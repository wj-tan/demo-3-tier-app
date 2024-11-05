# Rhel Version
#!/bin/sh

# Install prerequisites
sudo dnf install -y gnupg curl

# Add MongoDB repository key and repository
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg --yes -o /etc/pki/rpm-gpg/RPM-GPG-KEY-mongodb-org-8.0 --dearmor

# Create the MongoDB repo file for RHEL
echo "[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc" | sudo tee /etc/yum.repos.d/mongodb-org-8.0.repo

# Update package lists and install MongoDB
sudo dnf install -y mongodb-org

# Start and enable MongoDB
sudo systemctl daemon-reload
sudo systemctl start mongod
sudo systemctl enable mongod

# Create directory for data if it doesnt exist
sudo mkdir -p /root/employee_db

# Import JSON data
DATA_FILE="/root/demo-3-tier-app/db_vm/MOCK_DATA.json"
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

# Open Firewall port for replica set
sudo firewall-cmd --permanent --add-port=27017/tcp
sudo firewall-cmd --reload

echo "MongoDB setup and data import completed."
