#!/bin/bash

if [ -z "$1" ]; then
  ASKPASS='-k -K --ask-vault-pass'
else
  ASKPASS='--vault-password-file=.vaultpass'
fi

#sleep 1
ANSIBLE_NOCOWS=1 ansible-playbook -i inventory $ASKPASS site.yml
