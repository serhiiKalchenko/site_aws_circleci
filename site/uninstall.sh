#!/bin/bash

#stop & remove containers
docker-compose down

#remove volume 'joomla'
echo "Removing volume 'joomla':"
docker volume rm joomla
echo "Removing network..."
docker network prune

