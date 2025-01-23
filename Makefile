PT=platform-tools
PTZ=${PT}.zip
ADB=${PT}/adb
FBT=${PT}/fastboot

PDUMPD=payload-dumper-go
PDUMP=$(PDUMPD)/$(PDUMPD)
PATCHED=bin/boot.patched.img
TWRPF=twrp-3.7.0_12-v7.2_A12-apollo-skkk.img

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

	# from https://xdaforums.com/t/recovery-twrp-3-7-0-unofficial-mi-10t-pro.4518491/
	curl -sL https://xdaforums.com/attachments/twrp-3-7-0_12-v7-2_a12-apollo-skkk-zip.5826217 -o bin/twrp.zip
	unzip bin/twrp.zip $(TWRPF) -d bin/
	mv bin/$(TWRPF) bin/twrp.img
	rm bin/twrp.zip

extract-boot:
	ZIP=$$(ls -1 bin/miui*.zip | tr '\n' '\0' | xargs -0 -n 1 basename); \
	unzip -o -j bin/$$ZIP boot.img -d bin
	$(ADB) push bin/boot.img sdcard

pull-patched:
	PATCHED=$$( $(ADB) shell ls -p /storage/emulated/0/Download/magisk_patched-*.img | tail -n1); \
	$(ADB) pull $$PATCHED $(PATCHED)

boot-loader:
	${ADB} reboot bootloader

flash-twrp:
	# from fastboot
	$(FBT) flash recovery bin/twrp.img

flash-patched:
	$(FBT) flash boot $(PATCHED)

flash-oem:
	# from twrp
	ZIP=$$(ls -1 bin/miui*.zip | tr '\n' '\0' | xargs -0 -n 1 basename); \
	$(ADB) push bin/$$ZIP tmp; \
	$(ADB) shell twrp install tmp/$$ZIP

clean:
	rm -rf bin


