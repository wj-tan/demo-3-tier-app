#!/bin/sh

apk add python3 --no-cache
python3 -m ensurepip  
pip3 install --upgrade pip
pip3 install flask 
pip3 install -r requirements.txt
