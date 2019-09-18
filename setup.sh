#!/usr/bin/env bash

echo "Lets get this party started!"
echo "We need some base information to set this up"
echo "pick an environment to build in. Your only option is:"
echo "1. AWS, so we won't even bother to ask which you choose, but to set this up we need you to"

echo "Please enter your aws_access_key, which will get stored in a vault on the vagrant server"
read aws_access_key


echo "Please enter your aws_secret_key, which will get stored in a vault on the vagrant server"
read aws_secret_key




if [ ! -e ./CentOS7 ] 
then
mkdir ./CentOS7
cd ./CentOS7
else 
echo "Can't create the CentOS7 directory, as one is already in place"
exit
fi
pwd

vagrant box add --provider=virtualbox centos/7
vagrant up
