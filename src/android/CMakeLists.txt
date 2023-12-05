
# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.19)

set(MODULE_NAME "SwitchboardExampleDSP")
project(${MODULE_NAME})

set(CMAKE_VERBOSE_MAKEFILE on)

set(PROJECT_ROOT ../..)
set(EXTENSION_DIR ${PROJECT_ROOT})
set(LIBS_DIR ${EXTENSION_DIR}/libs)
set(SWITCHBOARD_SDK_DIR ${LIBS_DIR}/switchboard-sdk)
set(CPP_SRC_DIR ${PROJECT_SOURCE_DIR}/src/main/cpp)

set(EXTENSION_SRC_ALL ${EXTENSION_DIR}/src/all)
set(EXTENSION_SRC_JVM ${EXTENSION_DIR}/src/jvm/src/main/cpp)

file(GLOB_RECURSE SOURCE_FILES
        "${EXTENSION_DIR}/src/all/*.cpp"
        "${EXTENSION_DIR}/src/all/*.c"
        "${EXTENSION_DIR}/src/jvm/*.cpp"
        "${CPP_SRC_DIR}/*.cpp")

# Set C++ standard to C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# now build app's shared lib
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} -g -UNDEBUG -DDEBUG=1")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -Os")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -g -UNDEBUG -DDEBUG=1")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -Os")

set(CMAKE_SHARED_LINKER_FLAGS_RELEASE
        "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} -s")

add_library(${MODULE_NAME} SHARED ${SOURCE_FILES})

find_package(SwitchboardSDK REQUIRED CONFIG)
target_link_libraries(${MODULE_NAME} SwitchboardSDK::SwitchboardSDK)

# List and set common include directories recursively
include_directories(PRIVATE
        "${SWITCHBOARD_SDK_DIR}/include"
        "${EXTENSION_SRC_ALL}/"
        "${EXTENSION_SRC_ALL}/AudioGraphNodes/Source"
        "${CPP_SRC_DIR}"
        "${CPP_SRC_DIR}/include")

# add lib dependencies
target_link_libraries(
        ${MODULE_NAME}
        android
        log
)
