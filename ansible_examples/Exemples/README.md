# Ansible
## ASIX M14-Projectes @edt Curs 2022-2023


### Exemples

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

 * **ansible_example_04_variables** Exemple per practicar treballar amb variables de disccionar-hi, 
   adreçar-se als seus elements, indexar i accedir segons el valor d'una altra variable. Trebala amb 
   un diccionari de hosts per practicar la configuració de *epoptes*.
