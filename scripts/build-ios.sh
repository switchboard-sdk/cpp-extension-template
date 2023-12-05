#!/bin/bash

set -eu

EXTENSION_NAME="SwitchboardExampleDSP"

PROJECT_DIR="$(git rev-parse --show-toplevel)"
BUILD_DIR="$PROJECT_DIR/build"
OUT_DIR="$PROJECT_DIR/out"
PROJECT_PATH="${PROJECT_DIR}/${EXTENSION_NAME}.xcodeproj"
SCHEME_NAME="${EXTENSION_NAME}IOS"
ARCHIVE_NAME="${EXTENSION_NAME}"
EXTENSION_BUILD_DIR="$BUILD_DIR/${ARCHIVE_NAME}/iOS"

# Clean build directory
rm -rf "$EXTENSION_BUILD_DIR"
mkdir -p "$EXTENSION_BUILD_DIR"

xcodebuild archive \
  	-project "${PROJECT_PATH}" \
	-scheme "${SCHEME_NAME}" \
	-configuration "Release" \
	-archivePath "$EXTENSION_BUILD_DIR/${ARCHIVE_NAME}-iphoneos.xcarchive" \
	-derivedDataPath "$BUILD_DIR/XcodeDerivedData/iOS" \
	-sdk iphoneos \
	SKIP_INSTALL=NO

xcodebuild archive \
  	-project "${PROJECT_PATH}" \
	-scheme "${SCHEME_NAME}" \
	-configuration "Release" \
	-archivePath "$EXTENSION_BUILD_DIR/${ARCHIVE_NAME}-iphonesimulator.xcarchive" \
	-derivedDataPath "$BUILD_DIR/XcodeDerivedData/iOS" \
	-sdk iphonesimulator \
	SKIP_INSTALL=NO

xcodebuild -create-xcframework \
	-framework "$EXTENSION_BUILD_DIR/${ARCHIVE_NAME}-iphoneos.xcarchive/Products/Library/Frameworks/${ARCHIVE_NAME}.framework" \
	-framework "$EXTENSION_BUILD_DIR/${ARCHIVE_NAME}-iphonesimulator.xcarchive/Products/Library/Frameworks/${ARCHIVE_NAME}.framework" \
	-output "$EXTENSION_BUILD_DIR/${ARCHIVE_NAME}.xcframework"

rm -rf "${OUT_DIR}/${ARCHIVE_NAME}/iOS"
mkdir -p "${OUT_DIR}/${ARCHIVE_NAME}/iOS"
cp -R \
	"${BUILD_DIR}/${ARCHIVE_NAME}/iOS/${ARCHIVE_NAME}.xcframework" \
	"${OUT_DIR}/${ARCHIVE_NAME}/iOS"