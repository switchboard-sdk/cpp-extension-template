#!/bin/bash

set -eu

EXTENSION_NAME="SwitchboardExampleDSP"

PROJECT_DIR="$(git rev-parse --show-toplevel)"
BUILD_DIR="${PROJECT_DIR}/build"
OUT_DIR="${PROJECT_DIR}/out"
EXTENSION_BUILD_DIR="${BUILD_DIR}/${EXTENSION_NAME}/jvm"

# Clean build directory
rm -rf "${EXTENSION_BUILD_DIR}"
mkdir -p "${EXTENSION_BUILD_DIR}"

pushd "${PROJECT_DIR}/jvm/"
./gradlew --no-daemon ${EXTENSION_NAME}:build
popd

cp "${PROJECT_DIR}/src/jvm/build/libs/${EXTENSION_NAME}.jar" "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.jar"

# Move the build JAR file to platform specific directory
unzip -q "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.jar" -d "${EXTENSION_BUILD_DIR}/tmp"
OS_NAME=$(ls "${EXTENSION_BUILD_DIR}/tmp/libs")
ARCH_NAME=$(ls "${EXTENSION_BUILD_DIR}/tmp/libs/${OS_NAME}")
rm -rf "${EXTENSION_BUILD_DIR}/tmp"
mkdir -p "${EXTENSION_BUILD_DIR}/${OS_NAME}/${ARCH_NAME}"
mv "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.jar" "${EXTENSION_BUILD_DIR}/${OS_NAME}/${ARCH_NAME}"

mkdir -p "${OUT_DIR}/${EXTENSION_NAME}/jvm/${OS_NAME}/${ARCH_NAME}"
cp "${EXTENSION_BUILD_DIR}/${OS_NAME}/${ARCH_NAME}/${EXTENSION_NAME}.jar" "${OUT_DIR}/${EXTENSION_NAME}/jvm/${OS_NAME}/${ARCH_NAME}"