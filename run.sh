#!/bin/bash

HOST=$1
USER=$2

if [ -z "$HOST" ]; then
  echo "provide host you want to apply changes to"
  exit 1
fi

if [ -z "$USER" ]; then
  echo "provide user you want to SSH with"
  exit 1
fi

if [ -z "$3" ]; then
  ASKPASS='-k -K --ask-vault-pass'
else
  ASKPASS='--vault-password-file=.vaultpass'
fi

echo "logging into $HOST as $USER"
#sleep 1
ansible-playbook -i "$HOST," -u $USER $ASKPASS -e "ansible_ssh_user=$USER" site.yml
