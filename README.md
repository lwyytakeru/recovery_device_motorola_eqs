Device configuration for Edge 30 Ultra / Edge X30 Pro (codenamed "eqs")
=========================================

The Motorola Edge 30 Ultra / Edge X30 Pro (codenamed _"eqs"_) is a flagship smartphone from Motorola mobility announced in December 2021.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Qualcomm SM8475 Snapdragon 8+ Gen 1 (4 nm)
CPU     | Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x1.8GHz Cortex-A510)
GPU     | Adreno 730
Memory  | 8/12 GB RAM (LPDDR5)
Shipped Android Version | 12.0, My UX 3.0 (Global) / MY UI 3.0 (China)
Storage | 128/256/512 GB (UFS 3.1)
Battery | Non-removable Li-Po 4610 mAh battery
Display | 2400 x 1080 pixels, 6.67 inches (~403 ppi density)
Camera  | 200MP (Main) + 50MP (Ultra-wide) + 12MP (Telephoto) + 60MP (Selfie)

## Device picture
![Motorola Edge 30 Ultra / Edge X30 Pro](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-30-ultra-3.jpg)

# Status
Current state of features:
- [x] Correct screen/recovery size
- [x] Working touch, display
- [x] Screen goes off and on
- [x] Backup/restore to/from internal/external storage and adb
- [x] Poweroff
- [x] Reboot to system, bootloader, recovery, fastboot, edl
- [x] ADB (including sideload)
- [x] Support EROFS/F2FS/EXT4/exFAT/FAT32/NTFS
- [x] Decrypt /data
- [x] Flashing zip/images
- [x] MTP export
- [x] All important partitions listed in wipe/mount/backup lists
- [x] Input devices via USB-OTG
- [x] USB mass storage export
- [x] Correct date
- [x] Battery level
- [x] Set brightness
- [x] Vibrate and set vibration
- [x] Screenshot
- [x] Advanced features

# Optimization roadmap (Edge 30 Ultra - 12 GB / 256 GB)

This tree is already in good shape for daily recovery use. If your goal is to improve reliability, speed and maintainability, prioritize the items below.

## 1) Security hardening (highest priority)
- Move from permissive SELinux to enforcing during normal operation and keep permissive only as a debug fallback.
- Replace test AVB keys with dedicated release keys before official/public builds.
- Keep anti-rollback bypass only for local testing builds; avoid it in release artifacts.

## 2) Decryption and data stability
- Validate FBE/FDE flow across cold boot, reboot to recovery and OTA sideload paths.
- Test decryption with PIN/password/pattern and with multiple user profiles.
- Add a simple regression checklist after each vendor blob update.

## 3) Boot and recovery responsiveness
- Benchmark boot-to-UI time before/after library/module updates.
- Keep only required recovery binaries and shared libraries to reduce ramdisk pressure.
- Review kernel module loading order to ensure only essential modules initialize in recovery.

## 4) A/B and dynamic partition robustness
- Recheck complete `AB_OTA_PARTITIONS` against stock payload metadata from the same firmware branch.
- Validate fastbootd resize/flash paths for `super`, `vendor_dlkm` and `product`.
- Confirm rollback and slot-switch behavior after failed sideload.

## 5) Storage path optimization (UFS 3.1)
- Validate fstab mount flags for `userdata` and metadata consistency with stock.
- Run backup/restore stress tests with large archives (>50 GB) to detect throttling or mount edge-cases.
- Validate NTFS/exFAT write behavior for external media workflows.

## 6) Maintenance and long-term quality
- Pin tree changes to specific stock firmware builds and document tested base version.
- Track updated proprietary blobs by category (crypto, boot, display, vibrator) to simplify bisects.
- Keep a short release checklist (decrypt, MTP, sideload, backup/restore, reboot targets).

# Building
```bash
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_eqs-eng
mka recoveryimage -j$(nproc --all)
```

**Copyright (C) 2023 Team Win Recovery Project**
