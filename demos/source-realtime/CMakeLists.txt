set(TARGET_NAME "SourceRealtimeDemo")

switchboard_add_console_app(${TARGET_NAME})

target_sources(${TARGET_NAME} PRIVATE
    main.cpp
)

target_link_libraries(${TARGET_NAME} PRIVATE SwitchboardExampleDSP)

install(
    FILES SourceRealtimeDemo.json
    DESTINATION ${CMAKE_INSTALL_BINDIR}
)