#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# PLATFORM
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := antares
# Don't use a custom bootloader
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
# Specific CPU type for ARMv7 (note for ARMv6 this is TARGET_ARCH_VARIANT_CPU)
TARGET_CPU_VARIANT := cortex-a9
# Enable symmetric multiprocessing
TARGET_CPU_SMP := true
# Architecture (i.e. arm, x86, etc.)
TARGET_ARCH := arm
# Architecture version (i.e. armv6, armv7, etc.)
TARGET_ARCH_VARIANT := armv7-a
TARGET_OTA_ASSERT_DEVICE := antares,tostab03
ARCH_ARM_HAVE_TLS_REGISTER := true


# KERNEL
# Commandline to pass to kernel (sourced from Dalepl's ICS ROM)
BOARD_KERNEL_CMDLINE := nvmem=128M@384M mem=1024M@0M vmalloc=256M video=tegrafb tegra_fbmem=0x3e8a00@0x1fbfa000 console=none debug_uartport=hsport usbcore.old_scheme_first=1 lp0_vec=8192@0x1fbee000 tegraboot=sdmmc board_info=4249:ff41:ff:ff:54 gpt
# Nit quite sure what this does...
BOARD_KERNEL_BASE := 0x10000000
# Page size of the stock boot.img and must be set correctly in order to boot - can be extracted from kernel source (note that this will vary based on kernel)
BOARD_KERNEL_PAGESIZE := 4096
# Path to the kernel source
TARGET_KERNEL_SOURCE := kernel/toshiba/tostab03
# Name of the kernel configuration file
TARGET_KERNEL_CONFIG := omni_tostab03_defconfig
# Prebuilt kernel - used if kernel compilation fails? (TBC)
#TARGET_PREBUILT_KERNEL := device/toshiba/tostab03/kernel


# DISPLAY
USE_OPENGL_RENDERER := true


# AUDIO
BOARD_USES_GENERIC_AUDIO := true


# GPS
BOARD_HAVE_GPS := true


# CAMERA
# TBA


# BLUETOOTH
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true


# USB
# TBA


# Wifi


# PARTITIONS
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
# Technically the recovery partition is 6291456. However, the build process assumes a spare page, so 
# the number here actually needs to be smaller.
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6100805
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 734003200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 1024


# RECOVERY
# Forces uses of prebuilt kernel instead of compiled kernel
#TARGET_PREBUILT_RECOVERY_KERNEL := device/toshiba/tostab03/recovery/kernel
# Path to custom init.rc for recovery
TARGET_RECOVERY_INITRC := device/toshiba/tostab03/recovery/init.rc
# Path to custom fstab for recovery
TARGET_RECOVERY_FSTAB := device/toshiba/tostab03/recovery/recovery.fstab
# No select button - use power button instead
BOARD_HAS_NO_SELECT_BUTTON := true
# No misc partition
BOARD_HAS_NO_MISC_PARTITION := true
# Set if an ext4 partition is larger than 2GB
BOARD_HAS_LARGE_FILESYSTEM := true


# TWRP
DEVICE_RESOLUTION := 1280x800
# Removes SD-card partitioning (to save space if needed)
#BOARD_HAS_NO_REAL_SDCARD := true
# Enable proper handling of /data/media for devices that use this path
RECOVERY_SDCARD_ON_DATA := true
# Remove reboot to bootloader option from TWRP menu
TW_NO_REBOOT_BOOTLOADER := true
# Default to external storage instead of internal on devices with dual storage
TW_DEFAULT_EXTERNAL_STORAGE := true
# Flashes zips from their location rather than copying them into /tmp (useful for ROMs that are too large to fit into RAM)
TW_FLASH_FROM_STORAGE := true
# Mount paths for dual storage devices - interval and "external" (note that actual SD cards will probably show up as sdcard2 when mounted)
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
