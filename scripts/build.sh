#!/bin/bash

set -eu

PROJECT_DIR="$(git rev-parse --show-toplevel)"

echo "Building iOS..."
bash "${PROJECT_DIR}/scripts/build-ios.sh"

echo "Building macOS..."
bash "${PROJECT_DIR}/scripts/build-macos.sh"

echo "Building JVM..."
bash "${PROJECT_DIR}/scripts/build-jvm.sh"

echo "Building Android..."
bash "${PROJECT_DIR}/scripts/build-android.sh"

echo "Building Web..."
bash "${PROJECT_DIR}/scripts/build-web.sh"