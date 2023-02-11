# Vagrant
## ASIX M14-Projectes @edt Curs 2022-2023

### Desplegament

 * **vagrant_docker** exemple de desplegament d'una VM que utilitza
   provisioning docker per descarregar imatges docker i posar-les en
   funcionament. Crea una xarxa docker anomenada *2hisx* usant un 
   shell inline.

   Desplea 4 imatges corresponents als serveis DAP, phpLdapAdmin, SSH
   i SAMBA:

   * *LDAP*: desplega el servei ldap en el container i el propaga al port 389 de la VM,
     que al seu temps és propagat al port 2389 de host amfitrió.

   * *phpLdapAdmin* Engega el servei phpldapadmin que propaga el seu port 80 al port 80 
     de la VM, que al seu temps és propagat al port 2080 del host amfitrió. Aquest servei
     contacta a través de la xarxa *2hisx* al servidor anomenat *ldap.edt.org* on hi ha
     el servei LDAP.  

   * *SSH* engega un container ssh amb validació d'usuaris contactant al servei LDAP a 
     través de la xarxa *2hisix* contactant amb el servidor lDAP *ldap.edt.org*. Aquest servei
     propaga el port 22 del container al port 2022 de la VM i aquesta el propaga al port
     2022 del host amfitrió (atenció que al host amfitrió al port 2222 hi ha propagat el 
     de la VM configurat per vagrant).

   * *SAMBA* desplega el servei samba que consta dels usuaris del servidor LDAP al que ha 
     contactat a través de la xarxa *2hisix* amb el servidor *ldap.edt.org*. Així doncs,
     els usuaris samba són en realitat els que incorpora del LDAP. Exporta els homes dels 
     usuaris i els recursos *public*, *privat*, *documentation* i *manpages*.


#### Verificació

 * LDAP

   ```
   amfitrió$ ldapsearch -x -LLL -h localhost:2389 -b 'dc=edt,dc=org'

   amfitrió$ ldapsearch -x -LLL -h <ip-vm> -b 'dc=edt,dc=org'
   ```

  * phpLdapAdmin

    ```
    navegador: localhost:2080/phpldapadmin

    navegador: <ip-vm>/phpldapadmin
    ```

  * SSH

    ```
    amfitrió$ ssh -p 2022 pere@localhost

    amfitrió$ ssh -p 2022 pere@<ip-vm>
    ```

  * SAMBA

    ```
    amfitrió$ smbclient -L //<ip-vm>
 
    amfitrió$ smbclient //<ip-vm>/public
  
    amfitrió$ smbclient -U pere%pere //<ip-vm>/pere
    ``` 


