function(generate_hex_bin TARGET)
    add_custom_command(TARGET ${TARGET} POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${TARGET}> ${TARGET}.hex
        COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${TARGET}> ${TARGET}.bin
        COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${TARGET}>
        COMMENT "Generating ${TARGET}.hex and ${TARGET}.bin"
    )
endfunction()

function(add_flash_target TARGET)
    add_custom_target(flash
        COMMAND st-flash write ${TARGET}.bin 0x08000000
        DEPENDS ${TARGET}
        COMMENT "Flashing ${TARGET}.bin to device"
    )
endfunction()

function(add_erase_target)
    add_custom_target(erase
        COMMAND st-flash erase
        COMMENT "Erasing device flash"
    )
endfunction()