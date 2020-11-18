#!/bin/bash

# Backup database 
docker exec db-joomla /usr/bin/mysqldump -u root --password=root --host=db --all_databases > joomla_db.sql
