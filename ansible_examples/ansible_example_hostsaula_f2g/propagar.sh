useradd -m -s /bin/bash ansible2hisx
$ scp ansible_key.pub guest@g24:/tmp

root@g24:~# mkdir /home/ansible2hisx/.ssh
root@g24:~# cp /tmp/ansible_key.pub /home/ansible2hisx/.ssh/authorized_keys
root@g24:~# chown -R ansible2hisx.ansible2hisx /home/ansible2hisx/.ssh

