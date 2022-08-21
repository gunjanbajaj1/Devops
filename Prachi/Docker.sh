#! /bin/bash

#Installing Docker - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

echo "Installing Docker"
sudo systemctl status docker | grep running
if [ $? -ne 0 ]
then 
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    apt-cache policy docker-ce
    sudo apt install docker-ce
    sudo systemctl status docker | grep running
    if [ $? -ne 0 ]
    then 
        echo "Docker installation failed"
    else
        echo "Docker is running"

    fi
else
    echo "Docker is already installed"
fi 
