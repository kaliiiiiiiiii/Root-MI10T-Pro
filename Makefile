PT=platform-tools
PTZ=${PT}.zip
ADB=${PT}/adb
FBT=${PT}/fastboot

PDUMPD=payload-dumper-go
PDUMP=$(PDUMPD)/$(PDUMPD)
PBIN=bin/payload.bin
PATCHED=bin/init_boot.patched.img

deps:
	mkdir -p apks
	mkdir -p bin
	sudo apt-get install curl unzip
	curl -o ${PTZ} https://dl.google.com/android/repository/platform-tools-latest-linux.zip
	unzip -o ${PTZ}
	rm $(PTZ)

	mkdir -p $(PDUMPD)
	curl -sL https://github.com/ssut/payload-dumper-go/releases/download/1.3.0/payload-dumper-go_1.3.0_linux_amd64.tar.gz | tar zxvf - -C $(PDUMPD)
	chmod +x $(PDUMP)


boot-loader:
	${ADB} reboot bootloader

oem-unlock:
	-$(MAKE) boot-loader
	$(FBT) flashing unlock

extact-boot:
	mkdir -p bin
	ZIP=$$( $(ADB) shell ls -p /storage/emulated/0/*.zip ); \
	ZIPL=bin/$$(basename $$ZIP); \
	$(ADB) pull $$ZIP $$ZIPL
	unzip -j $$ZIPL payload.bin -d bin
	$(PDUMP) -o bin -p init_boot $(PBIN)
	$(ADB) push bin/init_boot.img /storage/emulated/0/Download/init_boot.img

pull-patched:
	PATCHED=$$( $(ADB) shell ls -p /storage/emulated/0/Download/magisk_patched-*.img | tail -n1); \
	$(ADB) pull $$PATCHED $(PATCHED)

flash-patched:
	$(FBT) flash init_boot $(PATCHED)
	$(FBT) reboot

clean:
	rm -rf bin


