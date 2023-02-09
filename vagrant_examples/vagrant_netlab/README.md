# Vagrant
## ASIX M14-Projectes @edt Curs 2022-2023
### Exemples netlab

Exemples de laboratoris de xarxes amb un servidor i varis workers.

#### Exemples amb xarxa pública

 * **Vagrantfile_netlab_public_bridge** Amb una segona interfície de xarxa 
   pública que rep per dhcp una adreça ip de la xarxa externa on pertany
   el host amfitrió. 
   
 * **Vagrantfile_netlab_public_static** Amb una segona interfície de xaraxa
   publica amb una adreça ip assignada estàticament al la xarxa externa on 
   pertany el host amfitrió.

#### Exemples amb xarxa privada

 * **Vagrantfile_netlab_nat** Configuració de xarxa per defecte. Una sola 
   interfície Nat amb adreça constant 10.0.2.15/24 (virtualbox) que permet
   amb nat tenir connectivitat exterior però no a les altres vm.

 * **Vagrantfile_netlab_private_dhcp** Configuració amb una segona interfície
   de xarxa amb una adreça ip privada obtinguda per dhcp que permet 
   connectivitat entre les vm d'aquesta xarxa interna privada.

 * **Vagrantfile_netlab_private_static** Configuració amb una segona interfície
   amb una adreça privada assignada estàticament que permet connectivitat entre
   les màquines virtuals que pertanyen a aquesta xarxa.

#### Exemples amb múltiples màquines (iteratiu)

 * **Vagrantfile_multi_private** Exemple de creació de varies rèpliques de màquines
   virtuals amb un bucle. Tenen configuració de xarxa privada dinàmica per dhcp.

 * **Vagrantfile_multi_public** Exemple de creació de varies rèpliques de 
   màquines virtuals amb un bucle. Tenne configuració de xarxa publica usant
   un bridge.

