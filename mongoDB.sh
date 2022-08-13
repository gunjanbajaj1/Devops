#! /bin/bash

#Installing mongoDB
echo "Installing mongoDB"
sudo service mongod status | grep running;
if [ $? -ne 0 ]
then
    lsbRelease = lsb_release -sr
    case "$lsbRelease" in
    #case 1 - 20.04
    "20.04") ComplexInstallation;;

    "22.04") ComplexInstallation;;

    *) NormalInstallation;;
    esac
    sudo systemctl status mongod | grep running
    if [ $? -ne 0 ]
    then
        echo "mongod installation failed"
    else
        echo "mongod is running"
    fi
else
    echo "mongoDB is already installed"
fi

NormalInstallation () {
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    sudo apt update
    sudo apt install -y mongodb-org
    sudo systemctl enable mongod
    sudo systemctl start mongod
}

ComplexInstallation () {
    mkdir ~/solution
    cd ~/solution/
    cat
    sudo mv /etc/apt/sources.list.d/* ~/solution

    sudo rm /etc/apt/sources.list
    sudo cp ~/solution/sources.list /etc/apt/sources.list
    NormalInstallation
}


cat () {
    cat << EOF > ~/solution/sources.list 
    deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse

    deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse

    deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse

    deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse

    deb http://archive.canonical.com/ubuntu focal partner
    deb-src http://archive.canonical.com/ubuntu focal partner
    EOF
}