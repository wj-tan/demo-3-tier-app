#!/bin/sh

cd /root/employee_db
nohup gunicorn -k uvicorn.workers.UvicornWorker app:app --bind 0.0.0.0:8000 &

