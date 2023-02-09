# Vagrant
## ASIX M14-Projectes @edt Curs 2022-2023



 * **Vagrantfile_debian** Vagrantfile del servei LDAP en debian, que utilitza 
   l'script extern install.sh.

 * **Vagrantfile_debian_inline** Vagrantfile del servei LDAP en debian sense 
   usar un shcipt extern, sinó que utilitza un script inline en una variable.  

 * **Vagrantfile_alpine_debian_inline** Vagrantfile que engega el servei LDAP 
   en un alpine usant un script inline en una variable. Conté el codi també
   per fer el mateix en debian però està comentat.
 
 * **Vagrantfile_phpldapadmin_debian** Vagrantfile que engega el servei 
   phpldapadmin en un debian que contacta al servidor LDAP. *Atenció* cal
   modificar el fitxer i posar l'adreça IP apropiada de la VM amb el 
   servei LDAP

 * **install.sh** shell script d'instal·lació de LDAP per a debian

 * **ldap** Directori amb els fitxers de configuració necessaris per al servei ldap
   * DB_CONFIG  
   * edt.org.ldif  
   * ldap.conf  
   * slapd_alpine.conf  
   * slapd.conf

 * **phpldapadmin** directori amb els fitxers necessaris per a la configuració del
   servei phpldapadmin

   * config.php  
   * phpldapadmin.conf

