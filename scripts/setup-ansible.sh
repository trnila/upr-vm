#!/bin/sh
set -ex
DST=/etc/provisioner

apt-get install -y ansible git
if [ ! -d "$DST" ]; then
  git clone https://github.com/trnila/upr-vm.git "$DST" -b ansible
fi

# bootstrap first version
ansible-playbook --connection=local --inventory=127.0.0.1, "$DST"/ansible/playbook.yml
