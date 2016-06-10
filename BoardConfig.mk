#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH := device/huawei/y550

# Assert
TARGET_OTA_ASSERT_DEVICE := y550,Y550,Y550-L01,Y550-L02,Y550-L03

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
#add suffix variable to uniquely identify the board
TARGET_BOARD_SUFFIX := _32

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8916

# Architecture
TARGET_ARCH := arm
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_y550.c
TARGET_UNIFIED_DEVICE := true

# Kernel
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
TARGET_CUSTOM_KERNEL_HEADERS := device/huawei/y550/include
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive lpm_levels.sleep_disabled=1 androidboot.selinux=permissive
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_KERNEL_SEPARATED_DT := #bypass
BOARD_CUSTOM_BOOTIMG_MK := #bypass
BOARD_MKBOOTIMG_ARGS := --dt device/huawei/y550/dt.img --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x000002E0


# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1795144704
BOARD_CACHEIMAGE_PARTITION_SIZE := 201326592
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# TWRP
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/twrp/twrp.fstab
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TWHAVE_SELINUX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_INCLUDE_CRYPTO := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_INPUT_BLACKLIST := "accelerometer"

#Use dlmalloc instead of jemalloc for mallocs
MALLOC_IMPL := dlmalloc

# Include tzdata for recovery
PRODUCT_COPY_FILES += \
	bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
