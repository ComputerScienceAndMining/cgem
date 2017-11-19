#!/bin/bash

WEBAPP="/home/app/webapp"
SERVICE=app

# Seed
echo "Populating..."
docker-compose run --rm $SERVICE /bin/bash -l -c "RAILS_ENV=production $WEBAPP/bin/rake db:seed"
