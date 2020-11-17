#!/bin/bash

# Backup database 
docker exec db-joomla /usr/bin/mysqldump -u root --password=root --all_databases > joomla_db.sql
