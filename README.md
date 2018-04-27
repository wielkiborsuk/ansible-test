= Ansible installation guide =

== Fist steps ==
* install openssh-server to allow ssh connections
* add your key to authorized on the guest:
    * first you might need to run: ssh-keygen -f "~/.ssh/known_hosts" -R 10.10.32.240
    * cat ~/.ssh/id_rsa.pub | ssh user@hostname 'cat >> .ssh/authorized_keys'
    * cat ~/.ssh/id_rsa.pub >> .ssh/authorized_keys - if you're local
* make sudo run without pass for simplicity (ALL:ALL) NOPASSWD:ALL
* make su work for borsuk without password:
  * auth sufficient pam_succeed_if.so use_uid user = borsuk
  * place it under the `pam_rootok.so` line
* extract the slave machines ssh pubkey - for repos cloning
    - or just provide keys from another machine (especially for temporary environments)
    - these need to be provided beforehand if you run it locally
* run it as: `ansible-playbook -i "localhost," site.yml`
* don't like cows? `ANSIBLE_NOCOWS=1` or `ANSIBLE_COW_SELECTION=tux`
