#!/bin/bash
# Example-2 alpine + apache2

echo "Hello, i'am bootstraping..."
uname -a
cat /etc/os-release
ps
ip a
sudo apk add apache2 nmap
sudo service apache2 start
sudo sh -c "echo 'hello, this is my awsome web page' > /var/www/localhost/htdocs/index.html"
sudo cp /vagrant_data/index.html /var/www/localhost/htdocs/index.html
nmap localhost
