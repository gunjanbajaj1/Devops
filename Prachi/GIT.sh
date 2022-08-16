#! /bin/bash

#Installing GIT
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
