#! /bin/bash

#Installing GIT - https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04

echo "Installing GIT"
git --version;
if [ $? -ne 0 ]
then 
    sudo apt update
    sudo apt install -y git
    if [ $? -ne 0 ]
    then 
        echo "GIT installation failed"
    else
        gitVersion = $(git --version);
        echo "git version : $(gitVersion)"
    fi
else
    echo "GIT is already installed $(git --version)"
fi
