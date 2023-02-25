# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


### Pràctica LDAP amb phpLdapAdmin

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

 * **slapd.conf** Fitxer de condifuració del servei ldap.

 * **edt-org.ldif** Fitxer LDIF amb la base de dades LDAP de l'entitat *edt.org*.


Configuració phpLdapAdmin:

 * **config.php** Configuració del serveu phpldapadmin, el fitxer de configuració php.
   És important que es configuri apropiadament com contactar amb el servidor LDAP. 
   Usualment a través de *localhost* si els dos serveis estan al mateix host o amb el
   FQDN ldap.edt.org si no.

 * **phpldapadmin.conf** És part de la configuració del servidor web apache2. Indica les 
   directives que permeten l'accés a la seu web.


#### Playbooks

 * **playbook_ldap_debian.yaml** Playbook que instal·la i configura únicament el servei LDAP 
   en un debian.

 * **playbook_phpldapadmin_debian.yaml** Playbook que instal·la i configura únicament el
   servei phpldapadmin en un Debian. El servei LDAP ha d'estar prèviament insta·lat o un
   servidor LDAP ha d'estar engegat.

 * **playbook_ldap_phpldapadmin_debian.yaml** Playbook que instal·la conjuntament els serveis
   LDAP i phpldapadmin en un Debian.

 * **playbook_main_includes_debian.yaml** Playbook que instal·la els dos serveis (LDAP i phpldapadmin)
   usant un fitxer principal de playbook (aquest) i dos fitxers de include, parcials, on cada un 
   conté les tasques necessàries per instal·lar el servei corresponent.

   * **part_playbook_ldap_debian.yaml** Part o fitxer parcial amb les tasques per instal·lar LDAP.

   * **part_playbook_phpldapadmin_debian.yaml** Part o fitxer parcial amb les tasques per insta·lar 
     phpldapadmin.

 * **playbook_distros_ldap_phpldapadmin.yaml** Fitxer que instal3la els dos serveis usant includes
   per a cada servei i segons el tipus de distribució GNU/Linux del host remot.


