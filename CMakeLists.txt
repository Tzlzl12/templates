cmake_minimum_required(VERSION 3.24)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_COLOR_DIAGNOSTICS ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(compiler)
include(stm32f10x)
include(utils)

project(STM32F10x_Project C ASM)

set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/stm32f10x_flash.ld" CACHE PATH "Linker script")

if(NOT EXISTS ${LINKER_SCRIPT})
    message(FATAL_ERROR "Linker script not found: ${LINKER_SCRIPT}")
endif()

add_subdirectory(init)
add_subdirectory(dev)

add_executable(${PROJECT_NAME}.elf
    $<TARGET_OBJECTS:stdperiph>
    $<TARGET_OBJECTS:cmsis>
    $<TARGET_OBJECTS:startup>
)

target_include_directories(${PROJECT_NAME}.elf PRIVATE
    ${CMAKE_SOURCE_DIR}/init
    ${CMAKE_SOURCE_DIR}/dev/inc
    ${CMAKE_SOURCE_DIR}/src
)

target_compile_definitions(${PROJECT_NAME}.elf PRIVATE
    ${STM32F10X_DEVICE_TYPE}
    USE_STDPERIPH_DRIVER
)

add_subdirectory(src)

target_link_options(${PROJECT_NAME}.elf PRIVATE
    -T${LINKER_SCRIPT}
    -Wl,--print-memory-usage
)

generate_hex_bin(${PROJECT_NAME}.elf)
add_flash_target(${PROJECT_NAME}.elf)
add_erase_target()
