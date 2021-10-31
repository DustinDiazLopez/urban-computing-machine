#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    build-essential git ffmpeg \
    nodejs npm screen \
    python3-dev python3-venv

curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sudo sh ./get-docker.sh
