#!/bin/bash

set -eu

EXTENSION_NAME="SwitchboardExampleDSP"

PROJECT_DIR="$(git rev-parse --show-toplevel)"
EXTENSION_DIR="${PROJECT_DIR}"
BUILD_DIR="${PROJECT_DIR}/build"
OUT_DIR="${PROJECT_DIR}/out"
EXTENSION_OUTPUT_DIR="${BUILD_DIR}/${EXTENSION_NAME}/Android"

# Clean output directory
rm -rf "$EXTENSION_OUTPUT_DIR"
mkdir -p "$EXTENSION_OUTPUT_DIR"

# Delete cxx folder
rm -rf "$PROJECT_DIR/SwitchboardSDK/src/android/.cxx"
rm -rf "$EXTENSION_DIR/src/android/.cxx"

# Delete build folder
rm -rf "$PROJECT_DIR/android/build"
rm -rf "$PROJECT_DIR/SwitchboardSDK/src/android/build"
rm -rf "$EXTENSION_DIR/src/android/build"

# Build Android SDK
cd "$PROJECT_DIR/android"
./gradlew "${EXTENSION_NAME}":clean

./gradlew "${EXTENSION_NAME}":assembleRelease

AAR_NAME="${EXTENSION_NAME}"

AAR_NAME_RELEASE="${AAR_NAME}-release.aar"
AAR_NAME+=".aar"

mv "$EXTENSION_DIR/src/android/build/outputs/aar/$AAR_NAME_RELEASE" "$EXTENSION_DIR/src/android/build/outputs/aar/$AAR_NAME"
cp "$EXTENSION_DIR/src/android/build/outputs/aar/$AAR_NAME" "$EXTENSION_OUTPUT_DIR"
rm -rf "${OUT_DIR}/${EXTENSION_NAME}/Android"
mkdir -p "${OUT_DIR}/${EXTENSION_NAME}/Android"
cp "$EXTENSION_OUTPUT_DIR/$AAR_NAME" "${OUT_DIR}/${EXTENSION_NAME}/Android/$AAR_NAME"
