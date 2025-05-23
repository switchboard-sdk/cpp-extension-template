set(TARGET_NAME "SinkOfflineDemo")

switchboard_add_console_app(${TARGET_NAME})

target_sources(${TARGET_NAME} PRIVATE
    main.cpp
)

target_link_libraries(${TARGET_NAME} PRIVATE SwitchboardExampleDSP)

install(
    FILES SinkOfflineDemo.json input.wav
    DESTINATION ${CMAKE_INSTALL_BINDIR}
)