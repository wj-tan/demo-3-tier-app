#!/bin/bash

apk add nginx --no-cache
rc-update add nginx default
