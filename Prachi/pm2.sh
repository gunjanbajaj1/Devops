#! /bin/bash

#Installing pm2 - https://pm2.keymetrics.io/docs/usage/quick-start/

echo "Installing pm2"
sudo apt update
pm2 ls;
if [ $? -ne 0 ]
then 
    export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    npm install pm2@latest -g
    if [ $? -ne 0 ]
    then 
        echo "PM2 installation failed"
    else
        pm2list = $(pm2 ls);
        echo "pm2 list : pm2list"
    fi
else
    echo "pm2 is already installed"
fi  