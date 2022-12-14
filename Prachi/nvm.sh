#! /bin/bash

#Installing NVM - https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html

echo "Installing NVM"
nvm --version;
if [ $? -ne 0 ]
then
    sudo apt update
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    . ~/.nvm/nvm.sh
    nvm install --lts
    node -e "console.log('Running Node.js ' + process.version)"
    if [ $? -ne 0 ]
    then
        echo "NVM installation failed"
    else
        echo "nvm version : $(nvm --version)"
        echo "node version : $(node --version)"
        echo "npm version : $(npm --version)"        
    fi
else
    echo "NVM is already installed $(nvm --version)"
fi