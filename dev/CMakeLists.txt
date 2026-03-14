file(GLOB STDPERIPH_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.c")

add_library(stdperiph OBJECT ${STDPERIPH_SOURCES})

target_include_directories(stdperiph PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${CMAKE_SOURCE_DIR}/init
    ${CMAKE_SOURCE_DIR}/src
)

target_compile_definitions(stdperiph PUBLIC
    ${STM32F10X_DEVICE_TYPE}
    USE_STDPERIPH_DRIVER
)

target_compile_options(stdperiph PRIVATE -w)