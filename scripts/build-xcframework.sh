#!/usr/bin/env sh

readonly SCRIPT_FOLDER=$(dirname -- "$0")
cd "$SCRIPT_FOLDER" || exit

readonly PROJECT_ROOT_FOLDER="../LifoContainers"
readonly TEMP_ARCHIVE_FOLDER="../archives-temp"
readonly OUTPUT_FOLDER="../build"

readonly FRAMEWORK_NAME="LifoContainers"
readonly IOS_SIMULATOR_ARCHIVE_NAME="${FRAMEWORK_NAME}-iOS-Simulator.xcarchive"
readonly IOS_ARCHIVE_NAME="${FRAMEWORK_NAME}-iOS.xcarchive"
readonly MACOS_ARCHIVE_NAME="${FRAMEWORK_NAME}-macOS.xcarchive"

# creating .xcarchive for specified platform
create_archive() {
    platform=$1
    archive_name=$2

    xcodebuild archive \
        -project "${PROJECT_ROOT_FOLDER}/${FRAMEWORK_NAME}.xcodeproj" \
        -scheme "${FRAMEWORK_NAME}" \
        -destination "generic/platform=${platform}" \
        -archivePath "${TEMP_ARCHIVE_FOLDER}/${archive_name}"
}

create_archive "iOS Simulator" ${IOS_SIMULATOR_ARCHIVE_NAME}
create_archive "iOS" ${IOS_ARCHIVE_NAME}
create_archive "macOS" ${MACOS_ARCHIVE_NAME}

# Remove product folder with previous version of framework
rm -rf "${OUTPUT_FOLDER}"

# creating .xcframework
xcodebuild -create-xcframework \
    -archive "${TEMP_ARCHIVE_FOLDER}/${IOS_SIMULATOR_ARCHIVE_NAME}" \
    -framework "${FRAMEWORK_NAME}.framework" \
    -archive "${TEMP_ARCHIVE_FOLDER}/${IOS_ARCHIVE_NAME}" \
    -framework "${FRAMEWORK_NAME}.framework" \
    -archive "${TEMP_ARCHIVE_FOLDER}/${MACOS_ARCHIVE_NAME}" \
    -framework "${FRAMEWORK_NAME}.framework" \
    -output "${OUTPUT_FOLDER}/${FRAMEWORK_NAME}.xcframework"

# creating .zip
cd "$OUTPUT_FOLDER"
zip -r "${FRAMEWORK_NAME}.xcframework.zip" "${FRAMEWORK_NAME}.xcframework"

# cleanup
rm -rf "${TEMP_ARCHIVE_FOLDER}"
