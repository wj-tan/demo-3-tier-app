#!/bin/sh

cd /root/employee_app
nohup /usr/bin/gunicorn --bind 0.0.0.0:8080 app:app  &
