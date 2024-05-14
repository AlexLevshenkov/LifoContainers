#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")
cd "$SCRIPT_FOLDER" || exit

# folders
PROJECT_ROOT_FOLDER="../LifoContainers"
TEMP_ARCHIVE_FOLDER="../archives-temp"
OUPUT_FOLDER="../build"

# names of .xcarchive's
FRAMEWORK_NAME="LifoContainers"
IOS_SIMULATOR_ARCHIVE_NAME="${FRAMEWORK_NAME}-iOS-Simulator.xcarchive"
IOS_ARCHIVE_NAME="${FRAMEWORK_NAME}-iOS.xcarchive"
MACOS_ARCHIVE_NAME="${FRAMEWORK_NAME}-macOS.xcarchive"

# creating .xcarchive for iOS Simulator
xcodebuild archive \
    -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
    -scheme "${FRAMEWORK_NAME}" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "${TEMP_ARCHIVE_FOLDER}/${IOS_SIMULATOR_ARCHIVE_NAME}"

# creating .xcarchive for iOS
xcodebuild archive \
    -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
    -scheme "${FRAMEWORK_NAME}" \
    -destination "generic/platform=iOS" \
    -archivePath "${TEMP_ARCHIVE_FOLDER}/${IOS_ARCHIVE_NAME}"

# creating .xcarchive for macOS
xcodebuild archive \
    -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
    -scheme "${FRAMEWORK_NAME}" \
    -destination "generic/platform=macOS" \
    -archivePath "${TEMP_ARCHIVE_FOLDER}/${MACOS_ARCHIVE_NAME}"

# creating .xcframework
xcodebuild -create-xcframework \
    -archive "${TEMP_ARCHIVE_FOLDER}/${IOS_SIMULATOR_ARCHIVE_NAME}" -framework "${FRAMEWORK_NAME}.framework" \
    -archive "${TEMP_ARCHIVE_FOLDER}/${IOS_ARCHIVE_NAME}" -framework "${FRAMEWORK_NAME}.framework" \
    -archive "${TEMP_ARCHIVE_FOLDER}/${MACOS_ARCHIVE_NAME}" -framework "${FRAMEWORK_NAME}.framework" \
    -output "${OUPUT_FOLDER}/${FRAMEWORK_NAME}.xcframework"

# creating .zip
cd "$OUPUT_FOLDER"
zip -r "${FRAMEWORK_NAME}.xcframework.zip" "${FRAMEWORK_NAME}.xcframework"

# cleanup
rm -rf "${TEMP_ARCHIVE_FOLDER}"

open "${OUPUT_FOLDER}"
