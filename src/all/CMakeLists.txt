set(DIR "${CMAKE_CURRENT_SOURCE_DIR}")

set(PROJECT_ROOT ../..)
set(EXTENSION_DIR ${PROJECT_ROOT})
set(LIBS_DIR ${EXTENSION_DIR}/libs)
set(SWITCHBOARD_SDK_DIR ${LIBS_DIR}/switchboard-sdk)

target_include_directories(${TARGET_NAME} PRIVATE
    "${SWITCHBOARD_SDK_DIR}/include"
)

target_include_directories(${TARGET_NAME} PRIVATE
    "${DIR}"
    "${DIR}/AudioGraphNodes/Source"
)

target_sources(${TARGET_NAME} PRIVATE
    "${DIR}/ExampleDSPExtension.cpp"
    "${DIR}/AudioGraphNodes/Source/ExampleSourceNode.cpp"
    "${DIR}/AudioGraphNodes/Processor/ExampleProcessorNode.cpp"
    "${DIR}/AudioGraphNodes/Sink/ExampleSinkNode.cpp"
)
