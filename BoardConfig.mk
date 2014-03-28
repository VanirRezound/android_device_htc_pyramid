# Copyright (C) 2009 The Android Open Source Project
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

# Bootloader
BOARD_VENDOR := htc
TARGET_BOOTLOADER_BOARD_NAME := pyramid
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8660

# Kernel
BUILD_KERNEL := true
TARGET_KERNEL_CONFIG := Sultan_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/pyramid
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=pyramid no_console_suspend=1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01400000

# Architecture
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Qcom hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := legacy
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Audio
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_QCOM_TUNNEL_LPA_ENABLED := false
BOARD_QCOM_VOIP_ENABLED := true

# WiFi
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_BAND                        := 802_11_ABG
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/pyramid/bluetooth/vnd_pyramid.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/pyramid/bluetooth/include

# Camera
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
BOARD_USES_PMEM_ADSP := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNO_UPDATE_PREVIEW
BOARD_HAVE_HTC_FFC := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_DISABLE_ARM_PIE := true
# Camera wrapper
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := pyramid
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Sensors
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
BOARD_EGL_CFG := device/htc/pyramid/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Qcom BSP (Board Support Package)
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Power
TARGET_USES_CM_POWERHAL := true
TARGET_POWERHAL_NO_TOUCH_BOOST := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# RIL
BOARD_USES_LEGACY_RIL := true

# Misc
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# Boot-animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Hardware tunables
BOARD_HARDWARE_CLASS := device/htc/pyramid/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/htc/pyramid/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    files \
    file.te \
    hci_init.te \
    healthd.te \
    init.te \
    init_shell.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    untrusted_app.te \
    vold.te \
    wpa.te \
    wpa_socket.te

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/pyramid/ramdisk/fstab.pyramid
RECOVERY_FSTAB_VERSION := 2
USE_SET_METADATA := false

# Filesystem
BOARD_VOLD_MAX_PARTITIONS := 36
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_FLASH_BLOCK_SIZE := 262144
