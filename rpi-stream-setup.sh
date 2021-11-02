#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y ffmpeg v4l-utils vim git screen

sudo dphys-swapfile swapoff
cat /etc/dphys-swapfile | sed 's/CONF_SWAPSIZE=100/CONF_SWAP_SIZE=2048/' | sed 's/#CONF_MAXSWAP=2048/CONF_MAXSWAP=2048/' > /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

echo 
echo "[INFO]: Make sure the swap size has increased:"
cat /proc/meminfo | grep Swap
echo

echo "--------- TODO ----------"
echo "[INFO]: (1) Enable camera interface and (2) give 256 MBytes of ram to the GPU!"
read -p "[INFO]: Ready? "

sudo raspi-config

# ffmpeg -f v4l2 -input_format h264 -video_size 1280x720 -framerate 15 -threads 0 -i /dev/video0 -vcodec copy -an -f flv rtmp://159.203.188.180/show/rpi-zero-2
