#!/bin/sh

dnf install python3 -y
python3 -m ensurepip
pip3 install flask 
pip3 install -r requirements.txt
