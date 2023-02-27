# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


### Pràctica LDAP amb phpLdapAdmin amb alpine

Aquests exemples utilitzen un lab desplegant amb vagrant amb un server debian al que se li
instal·la LDAP amb la base de dades *edt.org* i l'eina d'administració gràfica phpLdapAdmin.


Fitxers de configuració de Vagrant i ansible

 * **Vagrantfile** Fitxer de creació de la màuina virtual.

 * **ansible_key** Clau privada de l'usuari *ansible* Cal que els permisos siguin 400.

 * **ansible_key.pub** Clau pública de l'usuari ansible, cal propagar-la dins de la màquina
   virtual o de les màquines remotes en el *authorized_keys* de l'usuari ansible.

 * **inventory.yaml** Inventory amb la definició de les xarxes i els hosts.

 * **ansible.cfg** Fitxer de configuració local d'ansible. Permet definir l'usuari, el fitxer
   de clau privada, l'inventory a usar i altres directives com no verificar les *host_keys*. En
   usar aquest fitxer les ordres d'execució requereixen menys arguments.


Configuració LDAP:

 * **slapd_alpine.conf** Fitxer de condifuració del servei ldap.

 * **edt-org.ldif** Fitxer LDIF amb la base de dades LDAP de l'entitat *edt.org*.


Configuració phpLdapAdmin:

 * **config.php** Configuració del serveu phpldapadmin, el fitxer de configuració php.
   És important que es configuri apropiadament com contactar amb el servidor LDAP. 
   Usualment a través de *localhost* si els dos serveis estan al mateix host o amb el
   FQDN ldap.edt.org si no.

 * **phpldapadmin_alpine.conf** És part de la configuració del servidor web apache2. Indica les 
   directives que permeten l'accés a la seu web.


#### Playbooks

 * **vars_alpine.yaml** Fitxer amb les variables usades en els playbooks.

 * **playbook_ldap_phpldapadmin_alpine.yaml** Playbook que instal·la i configura el servei LDAP 
   i el servei phpldapadmin en un alpine.

 * **playbook_distros_ldap_phpldapadmin.yaml** Playbook que aplica la instal·lació de LDAP
   i phpldapadmin al server segons el tipus de sistema GNU/Linux que sigui.

   * **part_playbook_ldap_alpine.yaml** Fitxer amb les tasques d'instal·lar LDAP a alpine,
     no és un playbook, és la part de tasques a fer include.

   * **part_playbook_phpldapadmin_alpine.yaml** Fitxer amb les tasques (no playbook) a relitzar
     per instal·lar phpldapadmin a alpine.
   
   * **part_playbook_ldap_debian.yaml** Part o fitxer parcial amb les tasques per instal·lar LDAP
     en un servdor Debian.

   * **part_playbook_phpldapadmin_debian.yaml** Part o fitxer parcial amb les tasques per insta·lar 
     phpldapadmin en un servidor Debian.


