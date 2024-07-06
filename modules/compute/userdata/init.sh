#!/bin/bash

dnf update 

dnf install nginx -y 

dnf install nginx -y 
systemctl enable nginx
systemctl start nginx
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
