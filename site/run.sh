#!/bin/bash

##############################
## running script on server ##
##############################

#if volume 'joomla' already exist - stop containers &  delete only volume 'joomla'!
[ "$(docker volume ls | grep joomla)" ] && ./uninstall.sh

echo "Creating volume 'joomla'..."
docker volume create joomla


joomla_data="/var/lib/docker/volumes/joomla/_data"

# checking if archive 'joomla-data.tar.bz2' exist...
if [ -f joomla-data.tar.bz2 ]; then
  echo "Extracting data from 'joomla-data.tar.bz2' to volume 'joomla'..."
  sudo tar -xpjf joomla-data.tar.bz2 -C $joomla_data
else
  echo "Archive 'joomla-data.tar.bz2' does not exist!"
  echo "Site launching is impossible..."
  exit
fi


# just for first launch of containers 
[ "$(docker volume ls | grep db)" ] && echo "Volume 'db' exist..." || docker volume create db


docker-compose up -d --build

sleep 15 # time needed for mounting volumes... for getting instalation/ dir available
# remove installation/ dir for running site

# checking if installation/ dir exist...
install=/var/lib/docker/volumes/joomla/_data/installation
if sudo test -d $install; then
  sudo rm -rf $install 
  echo "Dir '$install' has been removed..."  
else
  echo "Dir '$install' does not exist..."
fi


# restoring DB...
if [ -f "joomla_db.sql" ]; then
      echo "Restoring DB from a backup: 'joomla_db.sql'..."
      ./restore-db.sh
else
      echo "Database has initial state..."

fi
