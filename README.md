= Ansible installation guide =

== Fist steps ==
* install openssh-server to allow ssh connections
* add your key to authorized on the guest:
    * first you might need to run: ssh-keygen -f "~/.ssh/known_hosts" -R 10.10.32.240
    * cat ~/.ssh/id_rsa.pub | ssh user@hostname 'cat >> .ssh/authorized_keys'
* make sudo run without pass for simplicity (ALL:ALL) NOPASSWD:ALL
* extract the slave machines ssh pubkey - for repos cloning
    - or just provide keys from another machine (especially for temporary environments)
