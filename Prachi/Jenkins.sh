#! /bin/bash

#Installing Jenkins - https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04
#Installing JDK - https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04#installing-specific-versions-of-openjdk
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
