sudo apt-get update
sudo debconf-set-selections <<< 'slapd slapd/root_password password jupiter'
sudo debconf-set-selections <<< 'slapd slapd/root_password_again password jupiter'
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install slapd
sudo apt-get install -y ldap-utils slapd
sudo rm -rf /etc/ldap/slapd.d/*
sudo rm -rf /var/lib/ldap/*
sudo cp /tmp/DB_CONFIG /var/lib/ldap/.
sudo slaptest -Q -f /tmp/slapd.conf -F /etc/ldap/slapd.d &> /dev/null
sudo slapadd -F /etc/ldap/slapd.d -l /tmp/edt-org.ldif
sudo chown -R openldap.openldap /etc/ldap/slapd.d
sudo chown -R openldap.openldap /var/lib/ldap
sudo cp /tmp/ldap.conf /etc/ldap/ldap.conf
sudo service slapd enable
#sudo service slapd restart

sudo apt-get update
sudo apt-get -y install php-xml apache2
sudo wget http://ftp.de.debian.org/debian/pool/main/p/phpldapadmin/phpldapadmin_1.2.6.3-0.2_all.deb
sudo apt-get -y install ./phpldapadmin_1.2.6.3-0.2_all.deb
sudo rm phpldapadmin_1.2.6.3-0.2_all.deb
sudo cp /tmp/phpldapadmin.conf /etc/apache2/conf-enabled/phpldapadmin.conf
sudo cp /tmp/config.php  /etc/phpldapadmin/config.php
## Si es vol configurar per ip modificar la ip i descomentar i comentar el sed de localhost
## per defecte si en el mateix hosts config.php ja diu localhost
###sudo bash -c "echo 192.168.1.41 ldap.edt.org >> /etc/hosts"
##sudo sed -i 's/localhost/localhost ldap.edt.org/' /etc/hosts
sudo systemctl enable apache2
