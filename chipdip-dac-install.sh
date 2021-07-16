#!/bin/sh

echo "Installing ChipDip DACs..."

sudo cp Adding-CHIPDIP-DAC-to-Raspberry-Pi/chipdip-i2s-master-dac.dtbo /boot/overlays/chipdip-i2s-master-dac.dtbo
sudo chmod +x Adding-CHIPDIP-DAC-to-Raspberry-Pi/./chipdip-dac-driver_v1
sudo sed -i '/^exit 0/i Adding-CHIPDIP-DAC-to-Raspberry-Pi/./chipdip-dac-driver_v1 &' /etc/rc.local
sudo sed -i 's/^dtparam=audio=on/#dtparam=audio=on/g' /boot/config.txt
sudo sed -i -e '$adtoverlay=chipdip-i2s-master-dac' /boot/config.txt

echo "Reboot to complete installation"
