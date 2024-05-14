#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")
cd "$SCRIPT_FOLDER" || exit

PROJECT_ROOT_FOLDER="../LifoContainers"
CONFIGS_FOLDER="../configs"

swiftformat $PROJECT_ROOT_FOLDER --config $CONFIGS_FOLDER/.swiftformat
swiftlint lint --config $CONFIGS_FOLDER/.swiftlint.yml --fix $PROJECT_ROOT_FOLDER
swiftlint lint --config $CONFIGS_FOLDER/.swiftlint.yml $PROJECT_ROOT_FOLDER
