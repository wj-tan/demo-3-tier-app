#!/bin/sh

cd /root/employee_db

# Find the Gunicorn process ID (PID)
PID=$(pgrep gunicorn)

# Check if any Gunicorn process is running
if [ -n "$PID" ]; then
    echo "Killing Gunicorn process with PID: $PID"
    kill -9 $PID
    echo "Gunicorn process terminated."
else
    echo "No Gunicorn process found."
fi

nohup gunicorn -k uvicorn.workers.UvicornWorker app:app --bind 0.0.0.0:8000 &

