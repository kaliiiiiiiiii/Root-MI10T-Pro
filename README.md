# Root-OP12
Instructions &amp; Automation for rooting a OP12 device

> **Disclamer** \
> I am not responsible or liable in any way for any damages related to this project!

> **Warning** \
> Rooting your phone will invalidate the warranty! \
> Make sure to **only** have the target device connected over USB.

## Dependencies
Linux only for now

Install dependencies
```bash
sudo apt install make
git clone https://github.com/kaliiiiiiiiii/Root-OP12
cd Root-OP12

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
- [Raymo111/oneplus-7t-root](https://github.com/Raymo111/oneplus-7t-root)
- [ssut/payload-dumper-go](https://github.com/ssut/payload-dumper-go)
- [shortguide-02-04-2024-bootloader-root-safetynet - xdaforums](https://xdaforums.com/t/shortguide-02-04-2024-bootloader-root-safetynet.4654608/)
- [how-to-root-oneplus-12r-a-complete-guide - xdaforums](https://xdaforums.com/t/how-to-root-oneplus-12r-a-complete-guide.4663162/)
