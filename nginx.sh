#!/bin/bash
sudo yum update -y
sudo yum install -y nginx
sudo chkconfig nginx on
IP=`curl -sL http://169.254.169.254/latest/meta-data/public-ipv4`
echo "used IP Adress: ${IP}" > /usr/share/nginx/html/index.html
sudo service nginx start