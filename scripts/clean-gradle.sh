#!/bin/bash

set -eu

CXX_FOLDERS=$(find . -name ".cxx")

for CXX_FOLDER in ${CXX_FOLDERS}
do
	echo "Removing ${CXX_FOLDER}..."
	rm -rf "${CXX_FOLDER}"
done

BUILD_FOLDERS=$(find . -name "build" ! -path "**/node_modules/*" ! -path "**/SwiftPackages/*")

for BUILD_FOLDER in ${BUILD_FOLDERS}
do
	echo "Removing ${BUILD_FOLDER}..."
	rm -rf "${BUILD_FOLDER}"
done

IDEA_FOLDERS=$(find . -name ".idea" ! -path "**/node_modules/*")

for IDEA_FOLDER in ${IDEA_FOLDERS}
do
	echo "Removing ${IDEA_FOLDER}..."
	rm -rf "${IDEA_FOLDER}"
done

GRADLE_FOLDERS=$(find . -name ".gradle")

for GRADLE_FOLDER in ${GRADLE_FOLDERS}
do
	echo "Removing ${GRADLE_FOLDER}..."
	rm -rf "${GRADLE_FOLDER}"
done
