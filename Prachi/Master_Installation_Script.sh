#! /bin/bash

chmod +x *

#Installing GIT
echo "Do you wish to install GIT?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash GIT.sh; break;;
        No ) exit;;
    esac
done


#Installing NVM
echo "Do you wish to install nvm, node and npm ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash nvm.sh; break;;
        No ) exit;;
    esac
done

#Installing pm2
echo "Do you wish to install pm2 ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash pm2.sh; break;;
        No ) exit;;
    esac
done

#Installing nginx
echo "Do you wish to install nginx ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash nginx.sh; break;;
        No ) exit;;
    esac
done

#Installing Jenkins
echo "Do you wish to install Jenkins ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash Jenkins.sh; break;;
        No ) exit;;
    esac
done


#Installing mongoDB
echo "Do you wish to install mongoDB ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash mongoDB.sh; break;;
        No ) exit;;
    esac
done

#Installing Docker
echo "Do you wish to install Docker ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash Docker.sh; break;;
        No ) exit;;
    esac
done
