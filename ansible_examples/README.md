# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


### Configuració del Lab

Aquests exemples utilitzen un lab desplegant amb vagrant amb un server i tres workers.  Els hosts es 
creen amb un usuari *ansible*, s'han creat les claus SSH per aquest usuari i s'ha copiat la clau 
pública *ansible_key.pub* al *.ssh/authoritzed_keys* de l'usuari ansible. També s'ha configurat el 
sudo per permetre a l'usuari ansible esdevenir un usuari privilegiat sense necessitat de password.

 * **Vagrantfile** Fitxer de desplegament vagrant del lab amb el servidor i tres workers amb l'script
   inline de personalització de l'usuari ansible.

 * **ansible_key** Clau privada ssh de l'usuari ansible. Aquesta clau és la que permet accés des de 
   l'exterior via SSH de manera desatesa. Cal establir els permisos *400* a la clau.

 * **ansible_key_pub** Clau pública ssh de l'usuari ansible. Cal desar (afegir) aquesta clau al 
   *.ssh/authorized_keys* de l'usuari ansible  per permetre'n l'ccés remot ssh amb clau priv/pub. 

 * *script inline* que crea l'usuari ansible, copia la clau pública i li dona drets de sudo sense 
   password.
   ```
   $install_ssh_pubkey_script_debian = <<SCRIPT
   sudo useradd -m -s /bin/bash ansible
   sudo mkdir /home/ansible/.ssh
   sudo cp /vagrant/ansible_key.pub /home/ansible/.ssh/authorized_keys
   sudo chown -R ansible.ansible /home/ansible/.ssh/
   sudo bash  -c 'echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible'
   SCRIPT
   ```

#### Exemples

 * **ansible_example_00_localhost_lab** Exemple per verificar que ansible està correctament instal·lat
   usant tres interfícies del propi hosts, verificar la creació del inventari i comprovar-ne l'accés
   usant el mòdul *ping*.


 * **ansible_example_01_vagrant_public_lab** Exemple que desplega un lab amb un server i tres workers
   usant vagrant. Els quatre hosts estan en mode bridge i obtenen adreces IP de la xarxa externa. 
   S'utilitza l'usuari ansible i la seva clau SSH per accedir a les màquines. Utilitza l'inventory 
   *inventory_lab_public.yaml* que defineix tres xarxes. Aquest exemple aplica ansible amb el mòdul
   ping per verificar el funcionament d'ansible i la connectivitat amb els hosts de l'inventory.


 * **ansible_example_02_vagrant_private_lab** Exemple que desplega un lab amb un server i tres workers
   usant vagrant. Els quatre hosts estan en una xarxa privada.
   S'utilitza l'usuari ansible i la seva clau SSH per accedir a les màquines. Utilitza l'inventory
   *inventory_lab_private.yaml* que defineix tres xarxes. Aquest exemple aplica ansible amb el mòdul
   ping per verificar el funcionament d'ansible i la connectivitat amb els hosts de l'inventory.
   S'accedeix als hosts amb l'usuari *ansible* amb la seva clau privada *ansible_key*.

 * **ansible_example_03_hosts_aula_f2g** Exemple que desplega un lab a l'aula amb un server i tres worker
   usant quatre hosts de l'aula. S'utilitza el propi usuari de l'alume accedint via usuari i passwd.
   Utilitza l'inventory *inventory_aula.yaml* que defineix tres xarxes. Aquest exemple aplica ansible
   amb el mòdul ping per verificar el funcionament d'ansible i la connectivitat amb els hosts
   de l'inventory. S'accedeix als hosts amb l'usuari de l'alumne i el seu password.




