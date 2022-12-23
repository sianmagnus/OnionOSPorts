#!/bin/sh

# Timer initialisation
cd /mnt/SDCARD/App/PlayActivity
./playActivity "init"

if [ -f "/mnt/SDCARD/Roms/PORTS/Binaries/Duke Winter.port/FILE_HERE/duke3d.grp" ]; then
	killall audioserver
	killall audioserver.mod

	export LD_LIBRARY_PATH="/mnt/SDCARD/Roms/PORTS/Binaries/Duke Winter.port/lib:$LD_LIBRARY_PATH"
	cd "/mnt/SDCARD/Roms/PORTS/Binaries/Duke Winter.port/"
	./eduke32 ./FILE_HERE/duke3d.grp ./FILE_HERE/nwinter.grp ./FILE_HERE/nwactor.con ./FILE_HERE/nwdes.con ./FILE_HERE/nwinter.con &>"/mnt/SDCARD/Roms/PORTS/Binaries/Duke Winter.port/eduke_output.log"

	/mnt/SDCARD/miyoo/app/audioserver &

	# Timer initialisation
	cd /mnt/SDCARD/App/PlayActivity
	./playActivity "Duke Nuclear Winter"
else
	cd "/mnt/SDCARD/Roms/PORTS/Binaries/missingFile"
	./infoPanel
fi



