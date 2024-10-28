#!/bin/sh

cd /root/employee_app

# Find the Gunicorn process ID (PID)
PID=$(pgrep gunicorn)

# Check if Gunicorn is running
if [ -n "$PID" ]; then
    echo "Killing Gunicorn process with PID: $PID"
    kill -9 $PID
    echo "Gunicorn process terminated."
else
    echo "No Gunicorn process found."
fi

nohup gunicorn --bind 0.0.0.0:8080 app:app  &
