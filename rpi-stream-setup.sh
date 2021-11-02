#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y ffmpeg v4l-utils vim git screen

sudo dphys-swapfile swapoff
sudo nano /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

echo "enable camera interface and give 256 to GPU!"
read "Ready?"
echo 

sudo raspi-config

# ffmpeg -f v4l2 -input_format h264 -video_size 1280x720 -framerate 15 -threads 0 -i /dev/video0 -vcodec copy -an -f flv rtmp://159.203.188.180/show/rpi-zero-2
