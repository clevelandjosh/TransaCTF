#!/usr/bin/env bash
# ensure there is an interface with 

# if not set one up with 
# nmcli c modify ens3 ipv4.method auto
# nmcli c down enp0s3
# nmcli c up enp0s3

set -e


if [ -f /etc/centos-release ];
then
osrelease='centos'
fi

if [ -f /etc/redhat-release ];
then
osrelease='redhat'
fi

full=`cat /etc/$osrelease-release | tr -dc '0-9.'`
major=$(cat /etc/$osrelease-release | tr -dc '0-9.'|cut -d \. -f1)
minor=$(cat /etc/$osrelease-release | tr -dc '0-9.'|cut -d \. -f2)
asynchronous=$(cat /etc/$osrelease-release | tr -dc '0-9.'|cut -d \. -f3)

echo $osrelease Version: $full
echo Major Relase: $major
echo Minor Relase: $minor
echo Asynchronous Relase: $asynchronous

if [ $major \> 6 ];
then 

echo "running install"

sudo yum install -y wget || echo "wget installation failed" 
sudo yum -y check-update || echo "update failed"
sudo yum install -y gcc libffi-devel python-devel openssl-devel epel-release || echo "installation failed" 
sudo yum install -y python-pip python-wheel || echo "installation failed" 
sudo yum install -y git || echo "git installation failed" 
sudo yum install -y python python-setuptools || echo "python installation failed" 

sudo yum install -y boto boto3 || echo "boto installation failed" 
sudo easy_install pip || echo "pip easy installation failed" 
sudo pip install paramiko PyYAML Jinja2 httplib2 || echo "pip installation failed" 
sudo yum install -y sshpass || echo "sshpass installation failed"

sudo subscription-manager repos --enable rhel-7-server-ansible-2.6-rpms
sudo yum install -y ansible

ansible all -m ping --ask-pass

else
    echo "CentOS needs to be at least version 7"
fi

else

if [ -f /etc/lsb-release ]; then
  apt-get update
fi


