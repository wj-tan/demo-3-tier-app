#!/bin/sh

NAME=fastapi-mongodb-app
DIR=/root/employee_db
USER=root # This is the user id with which you are installing everything
GROUP=root
WORKERS=3
WORKER_CLASS=uvicorn.workers.UvicornWorker
BIND=unix:$DIR/run/gunicorn.sock
LOG_LEVEL=error

#cd /root/employee_db

cd $DIR

exec nohup gunicorn app:app \
  --workers $WORKERS \
  --worker-class $WORKER_CLASS \
  --user=$USER \
  --group=$GROUP \
  --bind=$BIND \
  --log-level=$LOG_LEVEL \
  --log-file=- &
#nohup gunicorn -k uvicorn.workers.UvicornWorker app:app --bind 0.0.0.0:8000 &

