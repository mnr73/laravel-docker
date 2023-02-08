#!/bin/bash

docker info > /dev/null 2>&1

# Ensure that Docker is running...
if [ $? -ne 0 ]; then
    echo "Docker is not running."

    exit 1
fi

if [ -z "${1}" ]; then
	DIR_NAME="."
else
	DIR_NAME=${1}
fi

if [ "${DIR_NAME}" == "." ]; then
	DIR_NAME="_temp-dir"
fi

if [ "${2}" == "php81" ]; then
	PHP_VER="php81"
else
	PHP_VER="php81"
fi

docker run --rm \
    --pull=always \
    -v "$(pwd)":/opt \
    -w /opt \
    laravelsail/${PHP_VER}-composer:latest \
    bash -c "laravel new ${DIR_NAME}"

CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
BOLD='\033[1m'
NC='\033[0m'

if [ "${DIR_NAME}" == "_temp-dir" ]; then
	CD_TEXT="docker compose up"
else
	CD_TEXT="cd ${DIR_NAME} && docker compose up"
fi

if sudo -n true 2>/dev/null; then
    sudo chown -R $USER: .
    echo -e "${BOLD}Get started with:${NC} ${CD_TEXT}"
else
    echo -e "${BOLD}Please provide your password so we can make some final adjustments to your application's permissions.${NC}"
    echo ""
    sudo chown -R $USER: .
    echo ""
    echo -e "${BOLD}Thank you! We hope you build something incredible. Dive in with:${NC} ${CD_TEXT}"
fi

shopt -s dotglob
cp -rf files/* $DIR_NAME

if [ "${DIR_NAME}" == "_temp-dir" ]; then
	mv $DIR_NAME/* .
	rm -d $DIR_NAME
fi