#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git -y

DB_NAME=
ROOT_PASSWORD=

# configure docker
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sudo sh ./get-docker.sh

# run docker contaner with mysql
sudo docker run --name mysql-db -d -p 3306:3306 -e MYSQL_DATABASE=wouldntyouliketoknowweatherboy -e MYSQL_ROOT_PASSWORD=password mysql

# download gitea
wget -O gitea https://dl.gitea.io/gitea/1.15.6/gitea-1.15.6-linux-amd64
chmod +x gitea

adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

chmod 750 /etc/gitea
chmod 640 /etc/gitea/app.ini

cp gitea /usr/local/bin/gitea

sudo systemctl enable gitea
sudo systemctl start gitea

export GITEA_WORK_DIR=/var/lib/gitea/
GITEA_WORK_DIR=/var/lib/gitea/ /usr/local/bin/gitea web -c /etc/gitea/app.ini
