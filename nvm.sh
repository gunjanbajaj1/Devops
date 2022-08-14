#! /bin/bash

#Installing NVM
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
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
    fi
else
    echo "NVM is already installed $(nvm --version)"
fi