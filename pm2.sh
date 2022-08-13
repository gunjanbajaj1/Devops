#! /bin/bash

#Installing pm2
echo "Installing pm2"
sudo apt update
pm2 --version;
if [ $? -ne 0 ]
then 
    npm install pm2@latest -g
    if [ $? -ne 0 ]
    then 
        echo "PM2 installation failed"
    else
        pm2version = $(pm2 --version);
        echo "pm2 version : $pm2version"    
        pm2list = $(pm2 ls);
        echo "pm2 list : pm2list"
    fi
else
    echo "pm2 is already installed $(pm2 --version)"
fi  