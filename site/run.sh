#!/bin/bash

##############################
## running script on server ##
##############################

# if site/ exist - delete it
[ -d "site" ] && echo "Directory "site" exists!"

# unpack packages
sudo tar -xpjf joomla-data.tar.bz2
sudo tar -xpjf db-data.tar.bz2

# prepare volumes & run containers
docker volume create joomla
docker volume create db
sudo rm -r /var/lib/docker/volumes/joomla/_data
sudo cp -rp joomla-data/ /var/lib/docker/volumes/joomla/_data
sudo rm -r /var/lib/docker/volumes/db/_data
sudo cp -rp db-data/ /var/lib/docker/volumes/db/_data
docker-compose up -d --build
