#! /bin/bash

#Installing nginx - https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04

echo "Installing nginx"
systemctl status nginx;
if [ $? -ne 0 ]
then 
    sudo apt update
    sudo apt install -y nginx
    if [ $? -ne 0 ]
    then 
        echo "nginx installation failed"
    else   
        systemctl status nginx;
        if [ $? -ne 0 ]
        then 
            echo "nginx is installed but not running"
        else
            nginxStatus = systemctl status nginx;
            echo "nginx is running - $(nginxStatus)"
        fi
    fi
else
    echo "nginx is already installed"
fi 