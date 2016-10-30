#!/bin/bash

vagrant up
if [ $? -ne 0 ]; then
  vagrant provision
while [ $? -ne 0 ]; do
    PYTHONUNBUFFERED=1 ANSIBLE_HOST_KEY_CHECKING=false ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ControlMaster=auto -o ControlPersist=60s' ansible-playbook --connection=ssh --timeout=30 --limit="openstack" --inventory-file=/Users/Mans/Documents/projecten/openstack-course/.vagrant/provisioners/ansible/inventory --sudo -v provisioning/playbook.yaml
done

fi