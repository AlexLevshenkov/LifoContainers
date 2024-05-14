#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")
cd "$SCRIPT_FOLDER" || exit

PROJECT_ROOT_FOLDER="../LifoContainers"
TEMP_ARCHIVE_FOLDER="../archives-temp"

FRAMEWORK_NAME="LifoContainers"

# creating archive for iOS Simulator
xcodebuild archive \
    -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
    -scheme "${FRAMEWORK_NAME}" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "${TEMP_ARCHIVE_FOLDER}/${FRAMEWORK_NAME}-iOS-Simulator"

# creating archive for iOS
xcodebuild archive \
    -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
    -scheme "${FRAMEWORK_NAME}" \
    -destination "generic/platform=iOS" \
    -archivePath "${TEMP_ARCHIVE_FOLDER}/${FRAMEWORK_NAME}-iOS"

# creating archive for macOS
xcodebuild archive \
    -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
    -scheme "${FRAMEWORK_NAME}" \
    -destination "generic/platform=macOS" \
    -archivePath "${TEMP_ARCHIVE_FOLDER}/${FRAMEWORK_NAME}-macOS"
