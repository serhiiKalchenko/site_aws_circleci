#!/bin/bash

#stop & remove containers
docker-compose down

#remove volume 'joomla'
docker volume rm joomla

