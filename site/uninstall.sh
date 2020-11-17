#!/bin/bash

docker-compose down

docker volume rm joomla

#docker volume rm db

#[ -d joomla-data ] && sudo rm -rf joomla-data && echo "joomla-data/ has been deleted..."
