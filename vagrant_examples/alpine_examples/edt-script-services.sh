#!/bin/bash

sudo apk add git nmap tree 

sudo mkdir -p /usr/share/edtasix
cd /usr/share/edtasix
sudo git clone https://gitlab.com/edtasixm06/M06-ASO
cd -

docker pull edtasixm06/ldap22:latest
docker pull edtasixm06/ldap22:phpldapadmin
docker pull edtasixm06/ssh22:base
docker pull edtasixm06/samba22:homes

docker images
docker network create 2hisx || echo "Network exists: 2hisx"
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d edtasixm06/ldap22:latest
docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/ldap22:phpldapadmin
docker run --rm --name ssh.edt.org -h ssh.edt.org --net 2hisx -p 2022:22 -d edtasixm06/ssh22:base
docker run --rm --name samba.edt.org -h samba.edt.org --net 2hisx -p 139:139 -p 445:445 --privileged -d edtasixm06/samba22:homes


