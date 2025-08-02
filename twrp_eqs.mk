#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from eqs device
$(call inherit-product, device/motorola/eqs/device.mk)

# Release name
PRODUCT_RELEASE_NAME := eqs

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := eqs
PRODUCT_NAME := twrp_eqs
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 30 ultra
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola
