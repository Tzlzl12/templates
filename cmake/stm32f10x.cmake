set(STM32F10X_DEVICE_TYPES 
    "STM32F10X_LD"      # Low Density
    "STM32F10X_LD_VL"   # Low Density Value Line
    "STM32F10X_MD"      # Medium Density
    "STM32F10X_MD_VL"   # Medium Density Value Line
    "STM32F10X_HD"      # High Density
    "STM32F10X_HD_VL"   # High Density Value Line
    "STM32F10X_XL"      # XL Density
    "STM32F10X_CL"      # Connectivity Line
)

set(STM32F10X_DEVICE_TYPE "STM32F10X_MD" CACHE STRING "STM32F10x device type")
set_property(CACHE STM32F10X_DEVICE_TYPE PROPERTY STRINGS ${STM32F10X_DEVICE_TYPES})

set(STM32F10X_FLASH_SIZE "64K" CACHE STRING "Flash size for linker script")

set(STM32F10X_RAM_SIZE "20K" CACHE STRING "RAM size for linker script")

function(stm32f10x_get_startup_file OUT_VAR)
    if(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_LD")
        set(${OUT_VAR} "startup_stm32f10x_ld.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_LD_VL")
        set(${OUT_VAR} "startup_stm32f10x_ld_vl.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_MD")
        set(${OUT_VAR} "startup_stm32f10x_md.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_MD_VL")
        set(${OUT_VAR} "startup_stm32f10x_md_vl.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_HD")
        set(${OUT_VAR} "startup_stm32f10x_hd.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_HD_VL")
        set(${OUT_VAR} "startup_stm32f10x_hd_vl.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_XL")
        set(${OUT_VAR} "startup_stm32f10x_xl.s" PARENT_SCOPE)
    elseif(STM32F10X_DEVICE_TYPE STREQUAL "STM32F10X_CL")
        set(${OUT_VAR} "startup_stm32f10x_cl.s" PARENT_SCOPE)
    else()
        set(${OUT_VAR} "startup_stm32f10x_md.s" PARENT_SCOPE)
    endif()
endfunction()