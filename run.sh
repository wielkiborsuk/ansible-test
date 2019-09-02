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

echo "logging into $HOST as $USER"
sleep 1
ansible-playbook -i "$HOST," -u $USER -k -K site.yml
