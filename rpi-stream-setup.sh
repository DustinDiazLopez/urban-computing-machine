#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y ffmpeg v4l-utils vim git screen

sudo dphys-swapfile swapoff
cat /etc/dphys-swapfile | sed 's/CONF_SWAPSIZE=100/CONF_SWAP_SIZE=2048/' > /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

echo "---------"
echo "[INFO]: enable camera interface and give 256 megs of the ram to the GPU!"
read "[INFO]: Ready?"
echo "---------"

sudo raspi-config

# ffmpeg -f v4l2 -input_format h264 -video_size 1280x720 -framerate 15 -threads 0 -i /dev/video0 -vcodec copy -an -f flv rtmp://159.203.188.180/show/rpi-zero-2
