cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project(SwitchboardExampleDSP VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(GNUInstallDirs)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR})

# jvm
find_package(Java REQUIRED)
# https://stackoverflow.com/questions/51047978/cmake-could-not-find-jni
set(JAVA_AWT_LIBRARY NotNeeded)
set(JAVA_JVM_LIBRARY NotNeeded)
find_package(JNI REQUIRED)

include_directories(${JNI_INCLUDE_DIRS})

# force off-tree build
if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "CMake generation is not allowed within the source directory!
  Remove the CMakeCache.txt file and try again from another folder, e.g.:
    mkdir build && cd build
    cmake ..
  ")
endif()

# default to Release build
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
endif()


set(PROJECT_ROOT ../..)
set(LIBS_DIR ${PROJECT_ROOT}/libs)
set(SWITCHBOARD_SDK_DIR ${LIBS_DIR}/switchboard-sdk)

set(TARGET_NAME SwitchboardExampleDSPExtension)
add_library(${TARGET_NAME} SHARED "")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} -g -UNDEBUG -DDEBUG=1")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -Os")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -g -UNDEBUG -DDEBUG=1")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -Os")

add_subdirectory("${PROJECT_ROOT}/src/all" "all")
add_subdirectory("${PROJECT_ROOT}/src/jvm/src/main/cpp")

add_library(SwitchboardSDK SHARED IMPORTED)
if(APPLE)
get_filename_component(SWITCHBOARD_SDK_LIB_PATH ${SWITCHBOARD_SDK_DIR}/jvm/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/libSwitchboardSDK.dylib ABSOLUTE)
else()
get_filename_component(SWITCHBOARD_SDK_LIB_PATH ${SWITCHBOARD_SDK_DIR}/jvm/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/libSwitchboardSDK.so ABSOLUTE)
endif()
set_target_properties(SwitchboardSDK PROPERTIES IMPORTED_LOCATION ${SWITCHBOARD_SDK_LIB_PATH})
target_link_libraries(${TARGET_NAME} SwitchboardSDK)