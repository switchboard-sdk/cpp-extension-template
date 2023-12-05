#!/bin/bash

set -eu

EXTENSION_NAME="SwitchboardExampleDSP"

PROJECT_DIR="$(git rev-parse --show-toplevel)"
BUILD_DIR="${PROJECT_DIR}/build"
OUT_DIR="${PROJECT_DIR}/out"
PROJECT_PATH="${PROJECT_DIR}/${EXTENSION_NAME}.xcodeproj"
SCHEME_NAME="${EXTENSION_NAME}MacOS"
EXTENSION_BUILD_DIR="$BUILD_DIR/${EXTENSION_NAME}/macOS"

# Clean build directory
rm -rf "$EXTENSION_BUILD_DIR"
mkdir -p "$EXTENSION_BUILD_DIR"

xcodebuild archive \
  	-project "${PROJECT_PATH}" \
	-scheme "${SCHEME_NAME}" \
	-configuration "Release" \
	-archivePath "$EXTENSION_BUILD_DIR/${EXTENSION_NAME}.xcarchive" \
	-derivedDataPath "$BUILD_DIR/XcodeDerivedData/macOS" \
	-sdk macosx \
	SKIP_INSTALL=NO

xcodebuild -create-xcframework \
	-framework "$EXTENSION_BUILD_DIR/${EXTENSION_NAME}.xcarchive/Products/Library/Frameworks/${EXTENSION_NAME}.framework" \
	-output "$EXTENSION_BUILD_DIR/${EXTENSION_NAME}.xcframework"

rm -rf "${OUT_DIR}/${EXTENSION_NAME}/macOS"
mkdir -p "${OUT_DIR}/${EXTENSION_NAME}/macOS"
cp -R \
	"${BUILD_DIR}/${EXTENSION_NAME}/macOS/${EXTENSION_NAME}.xcframework" \
	"${OUT_DIR}/${EXTENSION_NAME}/macOS"