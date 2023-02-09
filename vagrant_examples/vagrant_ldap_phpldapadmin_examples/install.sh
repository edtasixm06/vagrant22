# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# set slapd pass
debconf-set-selections <<< 'slapd slapd/root_password password jupiter'
debconf-set-selections <<< 'slapd slapd/root_password_again password jupiter'

DEBIAN_FRONTEND=noninteractive apt-get -y install slapd
apt-get install -y ldap-utils
rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp /vagrant/ldap/DB_CONFIG /var/lib/ldap/.
slaptest -Q -f /vagrant/ldap/slapd.conf -F /etc/ldap/slapd.d &> /dev/null
slapadd -F /etc/ldap/slapd.d -l /vagrant/ldap/edt.org.ldif
chown -R openldap.openldap /etc/ldap/slapd.d
chown -R openldap.openldap /var/lib/ldap
cp /vagrant/ldap/ldap.conf /etc/ldap/ldap.conf
sudo service slapd start
sudo service slapd restart

