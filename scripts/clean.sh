#!/bin/bash

set -eu

PROJECT_DIR="$(git rev-parse --show-toplevel)"

# Clean gradle files
echo "Cleaning Gradle files... "
bash "${PROJECT_DIR}/scripts/clean-gradle.sh"

# Clean Xcode project
echo "Cleaning Xcode project... "
rm -rf "${PROJECT_DIR}/SwitchboardExampleDSP.xcodeproj"