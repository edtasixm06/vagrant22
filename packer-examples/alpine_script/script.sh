id
pwd
cat /etc/os-release
apk update
apk add openldap openldap-back-mdb openldap-back-monitor
rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/openldap/*
cp /tmp/DB_CONFIG /var/lib/openldap/.
cp /tmp/slapd.conf /etc/openldap/slapd.conf
slapadd -l /tmp/edt-org.ldif
chown -R ldap.ldap /etc/openldap/slapd.d
chown -R ldap.ldap /var/lib/openldap
cp /tmp/ldap.conf /etc/openldap/ldap.conf
rc-update add slapd
apk add apache2  php-apache2 phpldapadmin
cp /tmp/phpldapadmin.conf /etc/apache2/conf.d/phpldapadmin.conf
cp /tmp/config.php  /etc/phpldapadmin/config.php
chgrp apache /etc/phpldapadmin/config.php
rc-update add apache2 


