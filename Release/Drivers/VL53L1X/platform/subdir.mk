################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L1X/platform/vl53l1_platform.c 

OBJS += \
./Drivers/VL53L1X/platform/vl53l1_platform.o 

C_DEPS += \
./Drivers/VL53L1X/platform/vl53l1_platform.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L1X/platform/%.o: ../Drivers/VL53L1X/platform/%.c Drivers/VL53L1X/platform/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F303x8 -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/21564/STM32CubeIDE/workspace_1.7.0/STM32F303_VL53L1X/Drivers/VL53L1X/core" -I"C:/Users/21564/STM32CubeIDE/workspace_1.7.0/STM32F303_VL53L1X/Drivers/VL53L1X/platform" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

