#!/bin/bash

# Backup local running Joomla site
# Run script as root!
projectDir=~/DevOps/joomla.site
cd /var/lib/docker/volumes/joomla/_data
sudo tar -cpjf $projectDir/site/joomla-data.tar.bz2 .
