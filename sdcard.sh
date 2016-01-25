# Move to downloads directory
cd ~/Downloads
# Download the Ubuntu mate compressed image file
wget https://ubuntu-mate.r.worldssl.net/raspberry-pi/ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img.bz2
# Extract the image file
bunzip2 ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img.bz2
# Delete the compressed image
rm ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img.bz2
# Clear the memory card. 
# WARNING: ENSURE IF of=/dev/mmcblk0 IS THE MEMORY CARD
sudo dd if=/dev/zero of=/dev/mmcblk0  bs=32M
# Write image file to memory card
sudo dd if=ubuntu-mate-15.10-desktop-armhf-raspberry-pi-2.img of=/dev/mmcblk0 bs=8MB
# exit the shell
exit
