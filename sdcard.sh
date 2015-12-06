cd ~/Downloads
wget https://ubuntu-mate.r.worldssl.net/raspberry-pi/ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img.bz2
sudo dd if=/dev/zero of=/dev/sdX  bs=8MB  count=1
bunzip2 ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img.bz2
sudo dd if=ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img of=/dev/mmcblk0 bs=8MB
