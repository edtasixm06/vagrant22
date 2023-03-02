
 * **debian_script** Crea una AMI Debian que conté pre-instal·lat ldap i phpldapadmin.
   Utilitza de provivioner un script.
   
 * **debian_ansible** Crea un AMI Debian amb LDAP i phpldapadmin pre-instal·lat. Utilitza
   ansible de provisioner.
   
 * **PROBLEMA: alpine_script** Crea un alpine i pre-instal·la LDAP i phpldapadmin. 
   Utilitza un script de provisioner.
   Problema: no va en no poder fer el sudo en el alpine tiny. 
   
 * **PROBLEMA: alpine_ansible** Crea un alpine i pre-instal·la LDAP i phpldapadmin. 
   Utilitza un playbook ansible de provisioner.
   Problema: no va en no poder fer l'autenticació SSH.
 
