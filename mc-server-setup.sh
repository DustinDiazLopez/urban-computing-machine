#!/bin/sh

# https://www.digitalocean.com/community/tutorials/how-to-create-a-minecraft-server-on-ubuntu-20-04
sudo apt-get update
sudo apt-get install screen git openjdk-17-jre-headless htop -y

sudo ufw allow 80
sudo ufw allow 25565

mkdir -p minecraft
cd minecraft
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev latest
echo "eula=true" > eula.txt

cp ../plugins/1.19/. ./plugins/.

# create a detached screen and run the command on the prev created screen
screen -dmS minecraft-server-spigot
screen -S minecraft-server-spigot -X stuff 'java -Xms3G -Xmx3G -XX:+UseG1GC -jar spigot-1.9.jar -p 80 -nogui\n'

# screen -ls
# screen -r <pid>