#!/bin/bash

#installing redis

echo "Installing Redis"
sudo systemctl status redis-server
if [ $? -ne 0 ]
then 
	sudo apt update
	sudo apt install redis-server
	sudo systemctl status redis-server
	if [ $? -ne 0]
	then
		echo " Redis installation failed"
	else
		Redisversion = $(redis-server -v);
		echo "Redis Version : $(Redisversion)"
	fi
else
	echo " Redis is already installed $(redis-server -v)"
fi
