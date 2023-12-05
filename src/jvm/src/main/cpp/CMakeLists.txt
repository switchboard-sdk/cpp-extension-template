set(DIR "${CMAKE_CURRENT_SOURCE_DIR}")

target_sources(${TARGET_NAME} PRIVATE
    "${DIR}/SBExampleDSPExtension.cpp"
    "${DIR}/AudioGraphNodes/SBExampleSourceNode.cpp"
)