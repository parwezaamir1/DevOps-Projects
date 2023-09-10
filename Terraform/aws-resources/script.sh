#!bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo echo "Hello Altamash" >/var/www/index.nginx-debian.html