#!/bin/bash
#This is a simple script to build the docker image

if [ $# -eq 0 ]
  then
    echo "No domain specified, will default to localhost, no SSL"
    read -p "Are you sure? [y/n] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            echo "Deploy aborted"
            [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
    fi
fi


echo "Initiating deploy for $1"

echo "Pulling changes..."

git pull

echo "Building docker image..."

DOMAIN=$1 docker compose build

echo "Bringing up containers..."

DOMAIN=$1 docker compose up -d

echo "Deployment finished succesfully!"