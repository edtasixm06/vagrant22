#!/bin/bash

sudo apk add git nmap apache2 docker tree 
sudo  addgroup vagrant docker
sudo rc-update add docker boot
sudo service docker start
sudo service apache2 start

mkdir /var/tmp/edtasixm06
cd /var/tmp/edtasixm06
git clone https://gitlab.com/edtasixm06/M06-ASO
sudo ln -s /var/tmp/edtasixm06/ /var/www/localhost/htdocs/.




