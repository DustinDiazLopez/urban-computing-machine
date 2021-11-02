sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install dnsmasq hostapd mosquitto
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

sudo raspi-config
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

