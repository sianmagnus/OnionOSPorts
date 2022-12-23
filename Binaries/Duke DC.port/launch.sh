#!/bin/sh

# Timer initialisation
cd /mnt/SDCARD/App/PlayActivity
./playActivity "init"

if [ -f "/mnt/SDCARD/Roms/PORTS/Binaries/Duke DC.port/FILE_HERE/duke3d.grp" ]; then
	killall audioserver
	killall audioserver.mod

	export LD_LIBRARY_PATH="/mnt/SDCARD/Roms/PORTS/Binaries/Duke DC.port/lib:$LD_LIBRARY_PATH"
	cd "/mnt/SDCARD/Roms/PORTS/Binaries/Duke DC.port/"
	./eduke32 ./FILE_HERE/duke3d.grp ./FILE_HERE/dukedc.grp &>"/mnt/SDCARD/Roms/PORTS/Binaries/Duke DC.port/eduke_output.log"

	/mnt/SDCARD/miyoo/app/audioserver &

	# Timer initialisation
	cd /mnt/SDCARD/App/PlayActivity
	./playActivity "Duke It Out In DC"
else
	cd "/mnt/SDCARD/Roms/PORTS/Binaries/missingFile"
	./infoPanel
fi



