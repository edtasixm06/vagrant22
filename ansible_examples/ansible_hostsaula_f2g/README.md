# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


#### Exemple

 * **ansible_hostsaula_f2g** Exemple que desplega un lab a l'aula amb un server i tres worker
   usant quatre hosts de l'aula. S'utilitza el propi usuari de l'alume accedint via usuari i passwd.
   Utilitza l'inventory *inventory_aula.yaml* que defineix tres xarxes. Aquest exemple aplica ansible
   amb el mòdul ping per verificar el funcionament d'ansible i la connectivitat amb els hosts 
   de l'inventory.

   S'accedeix als hosts amb l'usuari de l'alumne i el seu password.


   Verificació:

   ```
   ansible all  -k  -i inventory_aula.yaml -m ping
   ```

   S'utilitza un *playbook* que executa el mòdul *ping* i també genera un missatge per pantalla.

   ```
   ansible-playbook -k -i inventory_aula.yaml playbook_hostaula_ping.yaml
   ```

