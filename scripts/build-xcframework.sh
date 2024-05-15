#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")
cd "$SCRIPT_FOLDER" || exit

# folders
PROJECT_ROOT_FOLDER="../LifoContainers"
TEMP_ARCHIVE_FOLDER="../archives-temp"
OUTPUT_FOLDER="../build"

# names of .xcarchive's
FRAMEWORK_NAME="LifoContainers"
IOS_SIMULATOR_ARCHIVE_NAME="${FRAMEWORK_NAME}-iOS-Simulator.xcarchive"
IOS_ARCHIVE_NAME="${FRAMEWORK_NAME}-iOS.xcarchive"
MACOS_ARCHIVE_NAME="${FRAMEWORK_NAME}-macOS.xcarchive"

# creating .xcarchive for specified platform
create_archive() {
    xcodebuild archive \
        -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
        -scheme "${FRAMEWORK_NAME}" \
        -destination "generic/platform=${1}" \
        -archivePath "${TEMP_ARCHIVE_FOLDER}/${2}"
}

create_archive "iOS Simulator" ${IOS_SIMULATOR_ARCHIVE_NAME}
create_archive "iOS" ${IOS_ARCHIVE_NAME}
create_archive "macOS" ${MACOS_ARCHIVE_NAME}

# Remove product folder with previous version of framework
rm -rf "${OUTPUT_FOLDER}"

# creating .xcframework
xcodebuild -create-xcframework \
    -archive "${TEMP_ARCHIVE_FOLDER}/${IOS_SIMULATOR_ARCHIVE_NAME}" -framework "${FRAMEWORK_NAME}.framework" \
    -archive "${TEMP_ARCHIVE_FOLDER}/${IOS_ARCHIVE_NAME}" -framework "${FRAMEWORK_NAME}.framework" \
    -archive "${TEMP_ARCHIVE_FOLDER}/${MACOS_ARCHIVE_NAME}" -framework "${FRAMEWORK_NAME}.framework" \
    -output "${OUTPUT_FOLDER}/${FRAMEWORK_NAME}.xcframework"

# creating .zip
cd "$OUTPUT_FOLDER"
zip -r "${FRAMEWORK_NAME}.xcframework.zip" "${FRAMEWORK_NAME}.xcframework"

# cleanup
rm -rf "${TEMP_ARCHIVE_FOLDER}"

open "${OUTPUT_FOLDER}"
