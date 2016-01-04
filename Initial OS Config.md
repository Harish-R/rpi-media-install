<h3> Auto Login on Startup </h3>

<h3>Provide static IP</h3>
$ sudo vim /etc/network/interfaces
<b>Append</b><bR>
iface eth0 inet static <Br>
address 192.168.1.2 <br>
netmask 255.255.255.0 <br>
gateway 192.168.1.1 <br>

<h3>Maximize power output on USB ports </h3>
$ sudo apt-get install vim <br>
$ sudo vim /boot/config.txt <bR>
Uncomment line #max_usb_current and set it to <bR>
max_usb_current = 1 <br>
$ sudo shutdown -r 0 <bR>

<h3> Auto mount hard disk with UUID </h3>
sudo blkid <br>
Copy the UUID <br>
sudo vim /etc/fstab <br>
Append <br>
UUID=<UUID>	/media/fileHDD	ntfs-3g	defaults	0	0 <br>
UUID=<UUID> /media/mediaHDD ntfs-3g defaults	0	0 <br>

