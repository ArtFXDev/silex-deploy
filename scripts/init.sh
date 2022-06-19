#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m'

log-info () {
  echo -e "${BLUE}$1${NC}"
}

log-info "=> Starting the compose stack..."
docker-compose --env-file .env up -d

log-info "=> [Zou] Creating the Zou database..."
docker-compose exec zou-db su - postgres -c "createdb -T template0 -E UTF8 --owner postgres zoudb"

log-info "=> [Zou] Applying migrations..."
docker-compose exec zou-app zou upgrade-db

log-info "=> [Zou] Initializing entities..."
docker-compose exec zou-app zou init-data

log-info "=> [Zou] Creating admin account..."
docker-compose exec zou-app zou create-admin admin@example.com --password mysecretpassword
