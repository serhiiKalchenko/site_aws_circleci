#!/bin/bash

# Restoring database [on a running 'db-joomla' container]
docker exec -i db-joomla /usr/bin/mysql -u root --password=root --host=db  < joomla_db.sql
