target_sources(${PROJECT_NAME}.elf PRIVATE
    main.c
    stm32f10x_it.c
)

target_compile_options(${PROJECT_NAME}.elf PRIVATE
    -Wall
    -Wextra
)