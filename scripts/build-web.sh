#!/bin/bash

set -eu

EXTENSION_NAME="SwitchboardExampleDSP"

PROJECT_DIR="$(git rev-parse --show-toplevel)"
BUILD_DIR="$PROJECT_DIR/build"
OUT_DIR="${PROJECT_DIR}/out"
EXTENSION_BUILD_DIR="$BUILD_DIR/${EXTENSION_NAME}/web"
WEB_SRC_DIR="${PROJECT_DIR}/src/web"
CMAKE_BUILD_DIR="${EXTENSION_BUILD_DIR}/cmake-build"

BUILD_TYPE="Release"
CLEAN_BUILD=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --clean)
      CLEAN_BUILD=true
      shift
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

if [ $CLEAN_BUILD = true ]; then
    rm -rf "${EXTENSION_BUILD_DIR}"
fi

mkdir -p "${EXTENSION_BUILD_DIR}"

mkdir -p "${CMAKE_BUILD_DIR}"
pushd "${CMAKE_BUILD_DIR}"
emcmake cmake -B "${CMAKE_BUILD_DIR}" -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" "${WEB_SRC_DIR}"
make
cp "${EXTENSION_NAME}.wasm" "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.wasm"
popd

wasm2wat "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.wasm" -o "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.wat"
WASM_IMPORTS=$(grep "(import" < "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.wat" | sort | uniq)
echo "WASM imports: ${WASM_IMPORTS}"
NUMBER_OF_IMPORTS=$(echo "${WASM_IMPORTS}" | wc -l)
echo "Number of imports: ${NUMBER_OF_IMPORTS}"
if [ "$NUMBER_OF_IMPORTS" -gt 2 ]; then
    echo "Error: There are more than 2 imports in the WASM file. This is not expected."
    exit 1
fi

# Copying SDK files to out folder

mkdir -p "${OUT_DIR}/${EXTENSION_NAME}/web"
cp "${EXTENSION_BUILD_DIR}/${EXTENSION_NAME}.wasm" "${OUT_DIR}/${EXTENSION_NAME}/web/"