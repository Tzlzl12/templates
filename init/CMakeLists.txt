add_library(cmsis OBJECT
    system_stm32f10x.c
)

stm32f10x_get_startup_file(STARTUP_FILE)

target_include_directories(cmsis PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(cmsis PUBLIC
    ${STM32F10X_DEVICE_TYPE}
)

add_library(startup OBJECT
    startup/${STARTUP_FILE}
)