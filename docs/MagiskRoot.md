## Enable developer options

1. Boot the phone, skip all steps where possible
2. Navigate to `Settings`->`About Device`->`Version`
3. Tap 7 times on `Version No.` until `Developer Options` are enabled

## Enable ADB & OEM Unlocking
1. Navigate to `Settings`->`System & Updates`->`Developer Options`
2. Toggle (enable) `OEM Unlocking` and ` USB debugging`

## Unlock OEM
Make sure your device is connected over a USB-cable which supports **full** data transfer.

> **Warning** \
> This will delete all previous on the device stored data. Ensure to make a backup if necceceary.

Run (& accept prompt on mobile)
```bash
sudo make oem-unlock
```

Now repeat (without skipping all steps) [Enable developer options](#enable-developer-options) & [Enable ADB](#enable-adb--oem-unlocking)


## Install all updates
1. Navigate to **Settings**->`System & Updates`->`Sowftware updates`
2. If an update is available: \
    a. Install the update \
    b. Reboot \
    c. repeat [Install all updates](#install-all-updates) \
    There should be no pending updates now.
3. Navigate to `Sowftware updates`->*Three dots menu*->`Auto update`
4. Choose `Do not allow` for `Auto download`
5. Ensure `Auto-update overnight` is turned off.

## Download current OEM
1. Download [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater) and [Magisk](https://github.com/topjohnwu/Magisk/releases/latest) on the device.
2. Open **Oxygen updater**
3. For `Update method`, choose `Stable (full)`
4. Navigate to **Oxygen Updater**->`Settings`
5. Toggle (enable) `Advanced mode`
9. Click on `Download update` in **Oxygen Updater**

## Extract init_boot
Run
```bash
sudo make extact-boot
```

## Patch init_boot
1. Navigate to `Magisk`->`Install`->`Select patch file`
2. Select the file at `Downloads/init_boot.img`
3. Click on `Let's Go` to start the patching.

## Flash patched image
1. Run `sudo make pull-patched`
2. Run `sudo make boot-loader`
3. When booted into fastboot, run `sudo make flash-patched`
