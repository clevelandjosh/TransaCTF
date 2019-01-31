#!/usr/bin/env bash

if [ ! -e ~/CentOS7 ] 
then
mkdir ~/CentOS7
cd ~/CentOS7
else 
echo "Can't create the CentOS7 directory, as one is already in place"
exit
fi
pwd

vagrant box add --provider=virtualbox centos/7
vagrant init centos/7
vagrant up
