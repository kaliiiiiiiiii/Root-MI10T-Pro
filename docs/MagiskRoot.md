## Update to latest
Ensure the MIUI version is `V14.0.1.0.SJDMIXM` (latest since [EOL](https://trust.mi.com/misrc/updates/phone/#:~:text=Mi%2010T%20Pro))

## Unlock OEM
Follow instructions at [miui.com/unlock/download_en.html](https://en.miui.com/unlock/download_en.html)

## Enable ADB

1. Boot the phone, skip all steps where possible
2. Navigate to `Settings`->`About Phone`
3. Tap several times on `MIUI version` until `Developer Options` are enabled
4. Navigate to `Settings`->`Additional Settings`->`Developer options`
5. Toggle (enable) `USB debugging`

## Download current OTA ROM
1. Download the latest stable rom from [c.mi.com/global/miuidownload/detail/device/1900386](https://c.mi.com/global/miuidownload/detail/device/1900386) (or [xmfirmwareupdater.com/miui/apollo](https://xmfirmwareupdater.com/miui/apollo/#google_vignette)) to `./bin`

## Extract boot.img
Run
```bash
sudo make extract-boot
```

## Patch boot.img
1. [Magisk](https://github.com/topjohnwu/Magisk/releases/latest) on the device.
1. Navigate to `Magisk`->`Install`->`Select patch file`
2. Select the file at `/boot.img`
3. Click on `Let's Go` to start the patching.

## Flash patched image & TWRP
1. Run `sudo make pull-patched`
2. Run `sudo make boot-loader`
3. When booted into fastboot, run `sudo make flash-patched`


## Install TWRP
> **warning**
> This uses an unofficial and not open-source version of TWRP from [recovery-twrp-3-7-0-unofficial-mi-10t-pro | xdaforums](https://xdaforums.com/t/recovery-twrp-3-7-0-unofficial-mi-10t-pro.4518491/)

When booted into fastboot, run
```bash
sudo make flash-twrp
```


