#!/bin/bash
#This is a simple script to build the docker image

if [ $# -eq 0 ]
  then
    echo "No project name specified, please choose one"
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi


echo "Initializing Reflex project..."

cd ..

mkdir $1

cd $1

cp -r ../docker-reflex-template/docker_files/. .
cp ../docker-reflex-template/deploy.sh .

python3 -m venv .venv

source .venv/bin/activate

pip install --upgrade pip

pip install reflex

pip freeze > requirements.txt

reflex init

echo "Reflex project initialized succesfully!"