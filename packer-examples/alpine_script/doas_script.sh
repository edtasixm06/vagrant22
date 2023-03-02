doas id
doas pwd
doas cat /etc/os-release
doas apk update
doas apk add openldap-back-mdb openldap-back-monitor openldap openldap-clients nmap vim tree
doas rm -rf /etc/openldap/slapd.d/*
doas rm -rf /var/lib/openldap/*
doas cp /tmp/DB_CONFIG /var/lib/openldap/.
doas cp /tmp/slapd.conf /etc/openldap/slapd.conf
doas slapadd -l /tmp/edt-org.ldif
doas chown -R ldap:ldap /var/lib/openldap
doas cp /tmp/ldap.conf /etc/openldap/ldap.conf
doas rc-update add slapd 
doas apk add apache2 phpldapadmin php-apache2
doas cp /tmp/phpldapadmin.conf /etc/apache2/conf.d/phpldapadmin.conf
doas cp /tmp/config.php  /etc/phpldapadmin/config.php
doas chgrp apache /etc/phpldapadmin/config.php
doas rc-update add apache2 

