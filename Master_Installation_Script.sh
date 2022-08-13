#! /bin/bash

chmod +x DEVOPS/*

#Installing GIT
bash DEVOPS/GIT.sh

#Installing NVM
bash DEVOPS/nvm.sh

#Installing pm2
bash DEVOPS/pm2.sh

#Installing nginx
bash DEVOPS/nginx.sh

#Installing Jenkins
bash DEVOPS/Jenkins.sh

#Installing mongoDB
bash DEVOPS/mongoDB.sh