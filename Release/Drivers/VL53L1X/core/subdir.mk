################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L1X/core/vl53l1_api.c \
../Drivers/VL53L1X/core/vl53l1_api_calibration.c \
../Drivers/VL53L1X/core/vl53l1_api_core.c \
../Drivers/VL53L1X/core/vl53l1_api_debug.c \
../Drivers/VL53L1X/core/vl53l1_api_preset_modes.c \
../Drivers/VL53L1X/core/vl53l1_api_strings.c \
../Drivers/VL53L1X/core/vl53l1_core.c \
../Drivers/VL53L1X/core/vl53l1_core_support.c \
../Drivers/VL53L1X/core/vl53l1_error_strings.c \
../Drivers/VL53L1X/core/vl53l1_register_funcs.c \
../Drivers/VL53L1X/core/vl53l1_silicon_core.c \
../Drivers/VL53L1X/core/vl53l1_wait.c 

OBJS += \
./Drivers/VL53L1X/core/vl53l1_api.o \
./Drivers/VL53L1X/core/vl53l1_api_calibration.o \
./Drivers/VL53L1X/core/vl53l1_api_core.o \
./Drivers/VL53L1X/core/vl53l1_api_debug.o \
./Drivers/VL53L1X/core/vl53l1_api_preset_modes.o \
./Drivers/VL53L1X/core/vl53l1_api_strings.o \
./Drivers/VL53L1X/core/vl53l1_core.o \
./Drivers/VL53L1X/core/vl53l1_core_support.o \
./Drivers/VL53L1X/core/vl53l1_error_strings.o \
./Drivers/VL53L1X/core/vl53l1_register_funcs.o \
./Drivers/VL53L1X/core/vl53l1_silicon_core.o \
./Drivers/VL53L1X/core/vl53l1_wait.o 

C_DEPS += \
./Drivers/VL53L1X/core/vl53l1_api.d \
./Drivers/VL53L1X/core/vl53l1_api_calibration.d \
./Drivers/VL53L1X/core/vl53l1_api_core.d \
./Drivers/VL53L1X/core/vl53l1_api_debug.d \
./Drivers/VL53L1X/core/vl53l1_api_preset_modes.d \
./Drivers/VL53L1X/core/vl53l1_api_strings.d \
./Drivers/VL53L1X/core/vl53l1_core.d \
./Drivers/VL53L1X/core/vl53l1_core_support.d \
./Drivers/VL53L1X/core/vl53l1_error_strings.d \
./Drivers/VL53L1X/core/vl53l1_register_funcs.d \
./Drivers/VL53L1X/core/vl53l1_silicon_core.d \
./Drivers/VL53L1X/core/vl53l1_wait.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L1X/core/%.o: ../Drivers/VL53L1X/core/%.c Drivers/VL53L1X/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F303x8 -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/21564/STM32CubeIDE/workspace_1.7.0/STM32F303_VL53L1X/Drivers/VL53L1X/core" -I"C:/Users/21564/STM32CubeIDE/workspace_1.7.0/STM32F303_VL53L1X/Drivers/VL53L1X/platform" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

