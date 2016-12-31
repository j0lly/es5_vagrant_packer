#!/bin/bash
set -x
set -e

# We expect to have either ubuntu, centos or ec2-user on the instances

# Looking for Env vars passed from Vagrant ot Packer
OS="${OS:-ubuntu}"
_install_puppet_modules="puppet module install elasticsearch/elasticsearch"


# installing puppet and clean pkgs caches
case $OS in
  ubuntu|debian)
    sudo bash /tmp/scripts/debian.sh
    sudo apt-get clean
    # need puppetlabs apt module to use elasticsearch repo
    sudo puppet module install puppetlabs/apt
    ;;
  centos)
    sudo bash /tmp/scripts/centos_7_x.sh
    sudo yum clean all
    ;;
  amzlinux)
    sudo yum -y install puppet3
    sudo yum clean all
    ;;
    *)
    echo 'bad distro specified on $OS'
    exit 1
    ;;
esac

echo "installing puppet modules with puppet version: $(puppet --version)"
sudo mkdir -p /etc/puppet/modules
sudo $_install_puppet_modules
