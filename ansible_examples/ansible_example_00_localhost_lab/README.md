# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


Aquest és un exemple bàsic per verificar la instal·lació d'ansible, la creació d'un inventory 
(un en YAML i un INI), la verificació del format dels fitxer d'inventory i l'accés als hosts 
executant el mòdul ping. 

Es configura un inventoru amb les tres interfícies del host, la ip dle loopback, la ip pública
i la de la interfície docker. Per accedir s'utilitzarà el propi usuari que té accés via ssh amb
usuari/passwd. S'entén que el servei ssh està engegat.


Components:

 * **localhost.ini** inventori de hosts en format ini.
 * **localhost.yaml** inventory de hosts en format yaml.


#### Verificació de l'inventory

  Exemple de verificació del format de l'inventory

  ```
  ansible all --list-hosts -i localhost.yaml 

  ansible all --list-hosts -i localhost.ini
  ```

  Exemple de verificació de la configuració de l'inventory

  ```
  ansible-inventory -i localhost.yaml --list 

  ansible-inventory -i localhost.ini --list
  ```

#### Verificació d'ansible amb el mòdul ping

  Aplicació del mòdul *ping*  als hosts de l'inventory identificant-se amb el propi usuari
  i acceditn amb el password.

  ```
  ansible servernet -k -i inventory_lab_public.yaml -m ping
  ```

