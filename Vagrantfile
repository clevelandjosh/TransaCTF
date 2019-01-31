# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
   config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "~/data", "/vagrant_data", disabled: true
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
set -e

full=`cat /etc/centos-release | tr -dc '0-9.'`
major=$(cat /etc/centos-release | tr -dc '0-9.'|cut -d \. -f1)
minor=$(cat /etc/centos-release | tr -dc '0-9.'|cut -d \. -f2)
asynchronous=$(cat /etc/centos-release | tr -dc '0-9.'|cut -d \. -f3)
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
sudo pip install --upgrade pip
sudo pip install paramiko PyYAML Jinja2 httplib2 || echo "pip installation failed" 
sudo yum install -y sshpass || echo "sshpass installation failed"
if [[ $osrelease == 'redhat' ]]
then
sudo subscription-manager clean
sudo subscription-manager register
sudo subscription-manager repos --enable rhel-7-server-ansible-2.6-rpms
fi
sudo yum install -y ansible
# ansible all -m ping --ask-pass
else
    echo "CentOS needs to be at least version 7"
fi

  SHELL
end
