#!/bin/bash

# Retrieve last version
git pull origin master

# Build app
docker-compose build

# Restart app
docker-compose stop
docker-compose up -d
