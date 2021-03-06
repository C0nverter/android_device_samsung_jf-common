#
# Copyright (C) 2009 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

COMMON_PATH := device/samsung/jf-common

TARGET_SPECIFIC_HEADER_PATH += device/samsung/jf-common/include

# Platform
TARGET_BOARD_PLATFORM := msm8960

# Architecture
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 zcache msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_CONFIG := lineageos_jf_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/jf
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk

# Audio
BOARD_HAVE_SAMSUNG_CSDCLIENT := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/vnd_jf.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Camera Legacy Hacks
MALLOC_SVELTE := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_GCC_LIBC := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE := "true"
BOARD_CHARGER_ENABLE_SUSPEND := true

# LineageHW
BOARD_HARDWARE_CLASS += $(COMMON_PATH)/lineagehw

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Display
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

# Includes
TARGET_SPECIFIC_HEADER_PATH += $(COMMON_PATH)/include

# NFC
BOARD_NFC_HAL_SUFFIX := msm8960

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 2170552320
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 11900000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1181114368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624
BOARD_FLASH_BLOCK_SIZE := 131072

# Power
TARGET_POWERHAL_VARIANT := qcom

# Properties (reset them here, include more in device if needed)
TARGET_SYSTEM_PROP := $(COMMON_PATH)/system.prop

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# RIL
BOARD_PROVIDES_LIBRIL := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
include device/qcom/sepolicy/legacy-sepolicy.mk
BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy


# Wifi module
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_FW_PATH_AP := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/etc/wifi/bcmdhd_sta.bin"

ALLOW_MISSING_DEPENDENCIES := true
