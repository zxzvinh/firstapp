#!/usr/bin/env bash

if [ -e "/etc/vagrant-provisioned" ];
then
    echo "Vagrant provisioning already completed. Skipping..."
    exit 0
else
    echo "Starting Vagrant provisioning process..."
fi

# Install core components
sudo apt-get update -y
sudo apt-get install -y git

# Install Node.js
sudo apt-get update -y
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get update -y
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update -y
sudo apt-get install -y nodejs

# Install mongodb
sudo apt-get update -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org

#node js tool
sudo apt-get update -y
sudo npm install -g bower grunt-cli yo generator-meanjs
sudo apt-get update -y

# Install redis
sudo apt-get update -y
sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt-get update -y
sudo apt-get install -y redis-server

touch /etc/vagrant-provisioned

echo "--------------------------------------------------"
echo "Your vagrant installed"