# Enable build support for NFC open source vendor modules
ifeq ($(call is-board-platform-in-list, kalama),true)
TARGET_USES_STM_NFC := false
endif

STM_VENDOR_NFC := android.hardware.nfc@1.2-service-st
STM_VENDOR_NFC += nfc_nci.st21nfc.st

ifeq ($(strip $(TARGET_USES_STM_NFC)),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    vendor/st/opensource/halimpl/conf/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
    vendor/st/opensource/halimpl/conf/libnfc-hal-st-519_mtp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-519_mtp.conf

PRODUCT_PACKAGES += $(STM_VENDOR_NFC)
endif

ifeq ($(call is-board-platform-in-list, crow),true)
PRODUCT_COPY_FILES += \
    vendor/st/opensource/halimpl/conf/libnfc-hal-st-608_idp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-608_idp.conf
endif
