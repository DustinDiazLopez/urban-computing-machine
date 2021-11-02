#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y ffmpeg v4l-utils vim git screen

cat /proc/meminfo | grep Swap

sudo dphys-swapfile swapoff
cat /etc/dphys-swapfile | sed 's/CONF_SWAPSIZE=100/CONF_SWAP_SIZE=2048/' | sed 's/#CONF_MAXSWAP=2048/CONF_MAXSWAP=2048/' > /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

echo 
echo "[WARN]: Make sure the swap size has increased:"
cat /proc/meminfo | grep Swap
echo

echo "--------- TODO ----------"
echo "[WARN]: (1) Enable camera interface and (2) give 256 MBytes of ram to the GPU!"
read -p "[WARN]: Ready? "

sudo raspi-config
