# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


### Pràctica LDAP amb phpLdapAdmin

Aquest pràctica recull el treball fet en  le spràctiques anterior d’implementar LDAP i 
phpldapadmin en sistemes Alpine i Debian i d’incorporar la utilització de fitxers de 
variables i de includes de tasques.
Recull en un sol playbook la instal·lació tant per sistemes Alpine com per sistemes Debian.


Desplegament en Vagrant

 * **Vagrantfile** Fitxer de creació de la màuina virtual.

 * **ansible_key** Clau privada de l'usuari *ansible* Cal que els permisos siguin 400.

 * **ansible_key.pub** Clau pública de l'usuari ansible, cal propagar-la dins de la màquina
   virtual o de les màquines remotes en el *authorized_keys* de l'usuari ansible.

 * **private_key** Clau privada de l'usuri vagranet que s'utilitza per accedir a la màquina alpine.
   Cal copiar la clau de .vagrant un cop fet el desplegament.


Configuració ansible
 
 * **ansible.cfg** Fitxer de configuració local d'ansible. Permet definir l'usuari, el fitxer
   de clau privada, l'inventory a usar i altres directives com no verificar les *host_keys*. En
   usar aquest fitxer les ordres d'execució requereixen menys arguments.

 * **inventory.yaml** Inventory amb la definició de les xarxes i els hosts. Conté la definició de 
   quin usuari cal utilitzar per accedir per ssh a cada màquina: vagrant a alpine i ansible a debian.


Fitxers dels serveis LDAP i phpldapadmin

 * slapd_alpine.conf
 * slapd_debian.conf
 * edt-org.ldif
 * phpldapadmin_alpine.conf
 * phpldapadmin_debian.conf
 * config.php


#### Playbooks

Al fitxer vars.yam s’hi defineixen les variables en forma de diccionari YAML que permeten 
configurar tant LDAP com phpldapadmin. Esatan estructurades agrupades totes les de alpine 
en un diccionari alpine i totes les de debian en un diccionari debian.

El playbook s’ha estructurat en un sol play que defineix els hosts on actuar, que esdevingui usuari 
privilegiat, el fitxer de variables a utilitzar i les tasques a realitzar. 

De fet, les tasques s’han posat en fitxers individuals i en el playbook simplement de mostra 
per debug el tipus de sistema opetatiu remot i segons sigui alpine o debian
s’importen els fitxers apropiats.

Hi ha un fitxer de tasques per instal·lar ldap en un alpine, un altre per instal·lar ldap
en un debian, per instal·lar phpldapadmin en un alpine i finalment per instal·lar 
phpldapadmin en un debian.


 * **vars_alpine.yaml** Fitxer amb les variables usades en els playbooks.

 * **playbook_distros_ldap_phpldapadmin.yaml** Playbook que aplica la instal3lació de LDAP
   i phpldapadmin al server segons el tipus de sistema GNU/Linux que sigui.

   * **part_playbook_ldap_alpine.yaml** Fitxer amb les tasques d'instal·lar LDAP a alpine,
     no és un playbook, és la part de tasques a fer include.

   * **part_playbook_phpldapadmin_alpine.yaml** Fitxer amb les tasques (no playbook) a relitzar
     per instal·lar phpldapadmin a alpine.

   * **part_playbook_ldap_debian.yaml** Fitxer amb les tasques d'instal·lar LDAP a debian,
     no és un playbook, és la part de tasques a fer include.

   * **part_playbook_phpldapadmin_debian.yaml** Fitxer amb les tasques (no playbook) a relitzar
     per instal·lar phpldapadmin a debian.

