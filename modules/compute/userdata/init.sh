#!/bin/bash

dnf update  

dnf install nginx -y 
systemctl enable nginx
systemctl start nginx

firewall-offline-cmd --add-port=80/tcp
firewall-cmd --reload
