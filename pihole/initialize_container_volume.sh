#!/bin/sh

## Realpath of the script
PATH_FOLDER="$(dirname "$(realpath "$0")")"

## Load the docker compose .env file
if [ ! -e ${PATH_FOLDER}/.env ]; then
  printf "\e[38;5;214m[WRN]\e[0m Done!\n"
  exit 0
fi
. ${PATH_FOLDER}/.env


## Create the the rquired container (runtume) volume folder
if [ ! -z ${CONTAINER_VOLUME} ] && [ ! -e ${CONTAINER_VOLUME} ]; then
  mkdir -p ${CONTAINER_VOLUME}
fi

## Copy the container (runtume) volume folder structure
cp -r ${PATH_FOLDER}/volume_structure/. ${CONTAINER_VOLUME}

[ $? -eq 0 ] && printf "\e[32m[OK]\e[0m Done!\n" || printf "\e[31m[ERR]\e[0m Initialisation failed. Resolve the issue\n"

