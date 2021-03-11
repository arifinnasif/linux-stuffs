#!/bin/bash

ffmpeg \
	-f pulse \
	-ac 2 \
	-ar 44100 \
	-i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor \
	-f x11grab \
	-s 1920x1080 \
	-i :1+0,0 \
	-c:v libx265 \
	-c:a flac \
	-r 25 \
	"/home/nasif/Videos/classes/$(date +%F_%H-%M-%S) - $1.mkv"
