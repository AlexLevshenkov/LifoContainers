#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")
cd "$SCRIPT_FOLDER" || exit

PROJECT_ROOT_FOLDER="../LifoContainers"
TEMP_ARCHIVE_FOLDER="../archives-temp"

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
