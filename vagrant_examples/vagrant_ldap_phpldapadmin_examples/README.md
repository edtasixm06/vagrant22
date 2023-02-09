# Vagrant
## ASIX M14-Projectes @edt Curs 2022-2023


#### Exemples Debian:

 * **Vagrantfile_ldap_debian** Vagrantfile del servei LDAP en debian, que utilitza 
   l'script extern install.sh.

 * **Vagrantfile_ldap_debian_inline** Vagrantfile del servei LDAP en debian sense 
   usar un shcipt extern, sinó que utilitza un script inline en una variable.  

 * **Vagrantfile_alpine_debian_inline** Vagrantfile que engega el servei LDAP 
   en un alpine usant un script inline en una variable. Conté el codi també
   per fer el mateix en debian però està comentat.
 
 * **Vagrantfile_phpldapadmin_debian** Vagrantfile que engega el servei 
   phpldapadmin en un debian que contacta al servidor LDAP. *Atenció* cal
   modificar el fitxer i posar l'adreça IP apropiada de la VM amb el 
   servei LDAP

 * **Vagrantfile_ldap_phpldapadmin_debian** Vagrantfile que engega en una sola 
   màquina virtual els serveis LDAp i phpldapadmin. Fitxer recomenat per implementar
   i aprendre LDAP i phpldapadmin sobre una màquina de debian.  Acceés via el host
   amfitrió localhost ports 2389 i 2080 o via l'adreça ip de la VM i els ports
   389 i 80.

#### Exemples Alpine:

 * **Vagrantfile_ldap_alpine_debian_inline** Vafrantfile d'exemple d'implementar
   el servei LDAP en un Alpine Linux usant un script inline amb una variable de 
   *Ruby*. Manté també en una altre variable el codi necessari per per la 
   instal·lació en un Debian.

 * **Vagrantfile_ldap_phpldapadmin_alpine** Vagrantfile que implementa en una sola
   màquina virtual Alpine el servei LDAP i phpldapadmin. Fitxer recomenat per 
   implementar i aprendre LDAP i phpldapadmin sobre una màquina de Alpine.  Acceés 
   via el host amfitrió localhost ports 2389 i 2080 o via l'adreça ip de la VM 
   i els ports 389 i 80.

#### Exemples amb dues VM:

 * **Vagrantfile_2vm_ldap_phpldapadmin_debian** Vagrantfile que desplega dues VM debian
   una amb el servei LDAP i l'altra amb el servei phpldapadmin. Cal que en el 
   phpldapadmin es configuri apropiadament el fitxer */etc/hosts* per indicar que 
   l'entrada *ldap.edt.org* apunta apropiadament a l'adreça IP de la VM de LDAP.   


 * **Vagrantfile_2vm_ldap_phpldapadmin_alpine** Vagrantfile que desplega dues VM alpine
   una amb el servei LDAP i l'altra amb el servei phpldapadmin. Cal que en el 
   phpldapadmin es configuri apropiadament el fitxer */etc/hosts* per indicar que 
   l'entrada *ldap.edt.org* apunta apropiadament a l'adreça IP de la VM de LDAP. 

#### Fitxers de configuració

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

