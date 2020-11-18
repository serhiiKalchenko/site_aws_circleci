#!/bin/bash

# Backup local running Joomla site
# Run script as ROOT user!!! Permissions!
# Change 'projectDir' to your dir! Change path for 'tar' command! 
projectDir=~/DevOps/joomla.site
cd /var/lib/docker/volumes/joomla/_data
tar -cpjf $projectDir/site/joomla-data.tar.bz2 .
