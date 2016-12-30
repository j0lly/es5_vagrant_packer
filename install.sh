#!/bin/bash
set -x

# create new ssh key
[[ ! -f /home/ubuntu/.ssh/mykey ]] \
&& mkdir -p /home/ubuntu/.ssh \
&& ssh-keygen -f /home/ubuntu/.ssh/mykey -N '' \
&& chown -R ubuntu:ubuntu /home/ubuntu/.ssh

# install packages
apt-get update
apt-get -y install puppet

# install puppet modules
sudo puppet module install elasticsearch/elasticsearch

# clean up
apt-get clean
