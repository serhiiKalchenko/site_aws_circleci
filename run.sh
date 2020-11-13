#!/bin/bash

docker volume create joomla
docker volume create db
sudo rm -r /var/lib/docker/volumes/joomla/_data
sudo cp -rp joomla-data/ /var/lib/docker/volumes/joomla/_data
sudo rm -r /var/lib/docker/volumes/db/_data
sudo cp -rp db-data/ /var/lib/docker/volumes/db/_data
docker-compose up -d --build
