# Root-MI10T-Pro
Instructions &amp; Automation for rooting a MI10T-Pro device

> **Disclamer** \
> I am not responsible or liable in any way for any damages related to this project!

> **Warning** \
> Rooting your phone will invalidate the warranty! \
> Make sure to **only** have the target device connected over USB.s

## Dependencies
Windows for unlocking the bootloader, Linux for the rest

Install dependencies
```bash
sudo apt install make
git clone https://github.com/kaliiiiiiiiii/Root-MI10T-Pro
cd Root-MI10T-Pro

sudo make deps
```

## Root with Magisk
Follow [InitialSetup](docs/InitialSetup.md) (Unlock bootloader)

## Install updates
1. Download update with [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater)
2. Whilst **not** rebooting yet, follow the installation instructions
3. Navigate to `Magisk`->`Install`->`Install to interactive Slot (After OTA)`
4. Click on `Let's Go` to start installing magisk to the update.
5. Reboot the device

## References
- [kaliiiiiiiiii/Root-OP12)](https://github.com/kaliiiiiiiiii/Root-OP12)
- [miui.com/unlock/download_en.html](https://en.miui.com/unlock/download_en.html)
- [recovery-twrp-3-7-0-unofficial-mi-10t-pro | xdaforums](https://xdaforums.com/t/recovery-twrp-3-7-0-unofficial-mi-10t-pro.4518491/)