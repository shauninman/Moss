#!/bin/sh

PLATFORM="rgb30"
SDCARD_PATH="/storage/roms"
UPDATE_PATH="$SDCARD_PATH/MinUI.zip"
SYSTEM_PATH="$SDCARD_PATH/.system"
IMAGE_PATH="/usr/share/minui"
LAUNCH_PATH="$SYSTEM_PATH/$PLATFORM/paks/MinUI.pak/launch.sh"

echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

# copy firmware update from TF2 to TF1 and reboot
FW_PATH=$(ls -1 $SDCARD_PATH/MOSS*.tar 2>/dev/null | head -n 1)
if [[ ! -z "$FW_PATH" && -f "$FW_PATH" ]]; then
	ply-image $IMAGE_PATH/firmware.png
	mv $FW_PATH /storage/.update && sync && cat /dev/zero > /dev/fb0 && reboot
fi

# install/update
if [ -f "$UPDATE_PATH" ]; then 
	if [ -d "$SYSTEM_PATH" ]; then
		ply-image $IMAGE_PATH/updating.png
	else
		ply-image $IMAGE_PATH/installing.png
	fi
	
	unzip -o "$UPDATE_PATH" -d "$SDCARD_PATH" # &> $SDCARD_PATH/unzip.txt
	rm -f "$UPDATE_PATH"
	
	cat /dev/zero > /dev/fb0
fi

# no MinUI files detected
if [ ! -f "$LAUNCH_PATH" ]; then
	ply-image $IMAGE_PATH/missing.png
	sleep 10
	poweroff
fi

# launch it
while [ -f "$LAUNCH_PATH" ] ; do
	"$LAUNCH_PATH"
done
