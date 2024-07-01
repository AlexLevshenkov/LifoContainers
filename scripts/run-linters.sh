#!/usr/bin/env bash

readonly SCRIPT_FOLDER=$(dirname -- "${0}")
cd "${SCRIPT_FOLDER}" || exit

readonly PROJECT_ROOT_FOLDER="../LifoContainers"
readonly CONFIGS_FOLDER="../configs"

readonly OPTSTRING=":f"

run_swiftformat_lint() {
  swiftformat --lint "${PROJECT_ROOT_FOLDER}" --config "${CONFIGS_FOLDER}/.swiftformat"
}

run_swiftformat_fix() {
  swiftformat "${PROJECT_ROOT_FOLDER}" --config "${CONFIGS_FOLDER}/.swiftformat"
}

run_swiftlint_lint() {
  swiftlint lint --config "${CONFIGS_FOLDER}/.swiftlint.yml" "${PROJECT_ROOT_FOLDER}"
}

run_swiftlint_fix() {
  swiftlint lint --config "${CONFIGS_FOLDER}/.swiftlint.yml" --fix "${PROJECT_ROOT_FOLDER}"
}

while getopts "${OPTSTRING}" opt; do
  case ${opt} in
    f)
      run_swiftformat_fix
      run_swiftlint_fix
      run_swiftlint_lint
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

if [ "${OPTIND}" -eq 1 ]
then 
  run_swiftformat_lint
  run_swiftlint_lint
fi
