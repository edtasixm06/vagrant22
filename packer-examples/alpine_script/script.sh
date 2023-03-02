id
pwd
cat /etc/os-release
sudo apk add openldap openldap-back-mdb openldap-back-monitor
sudo root rm -rf /etc/openldap/slapd.d/*
doas root rm -rf /var/lib/openldap/*
doas root cp /tmp/DB_CONFIG /var/lib/openldap/.
#sudo slaptest -Q -f /vagrant/ldap/slapd_alpine.conf -F /etc/openldap/slapd.d &> /dev/null
#sudo slapadd -F /etc/ldap/slapd.d -l /vagrant/ldap/edt.org.ldif
sudo cp /tmp/slapd.conf /etc/openldap/slapd.conf
sudo slapadd -l /tmp/edt-org.ldif
#sudo chown -R ldap.ldap /etc/openldap/slapd.d
sudo chown -R ldap.ldap /var/lib/openldap
sudo cp /tmp/ldap.conf /etc/openldap/ldap.conf
sudo service slapd enable
#sudo service slapd restart

sudo apk update
# nota: cal insta·lar php5-aache2 perquè phpldapadmin l'utilitza 
# i no el php7-apach2 (no: php$phpverx-apache2)
sudo apk add apache2  php5-apache2 phpldapadmin
sudo cp /tmp/phpldapadmin.conf /etc/apache2/conf.d/phpldapadmin.conf
sudo cp /tmp/config.php  /etc/phpldapadmin/config.php
sudo chgrp apache /etc/phpldapadmin/config.php
# Repassar el mecanisme d'assignació del nom ldap.edt.org al host local
# Si ldap iphpldapadmin estan al mateix host eñ config.php ja diu localhost
#sudo bash -c "echo 192.168.1.41 ldap.edt.org >> /etc/hosts"
#sudo sed -i 's/alpine38.localdomain/alpine38.localdomain ldap.edt.org/' /etc/hosts
sudo service apache2 enable


