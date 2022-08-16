#! /bin/bash

#Installing Jenkins
echo "Installing Jenkins"
sudo systemctl status jenkins | grep running
if [ $? -ne 0 ]
then 
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install -y default-jre
    sudo apt install -y default-jdk
    sudo apt install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl status jenkins | grep running
    if [ $? -ne 0 ]
    then 
        echo "jenkins installation failed"
    else
        echo "mongod is running"

    fi
else
    echo "jenkins is already installed"
fi 
