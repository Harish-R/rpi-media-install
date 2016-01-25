<h3>Resize partition</h3>
<code> $ sudo fdisk /dev/mmcblk0p2 </code><br>
Delete the partition by entering <strong>d</strong> and then <strong>2</strong><bR>
Create again by entering <strong>n</strong>, <strong>2</strong>, <strong>ENTER</strong>, <strong>ENTER</strong>, <strong>w</strong> <bR>
<code> $ sudo resize2fs /dev/mmcblk0p2 </code><br>

<h3>Remove Unwanted softwares</h3>
<code>$ sudo apt-get purge -y sonic-pi minecraft-pi scratch idle idle3 brasero libreoffice-calc libreoffice-math libreoffice-impress libreoffice-draw</code><br>
<code>$ sudo apt-get autoremote</code><br>

<h3>Install required software</h3>
<code>$ sudo apt-get install -y vim gedit</code>

<h3> Auto Login on Startup </h3>
<b>Use when using GUI on Raspberry Pi</b><br>
<code>$ sudo gedit /etc/lightdm/lightdm.conf.d/60-myconfig.conf </code><br>
<b>Use when using ssh to Raspberry Pi</b><br>
Note: Replace USERNAME with your user name <br>
<code>$ sudo echo "autologin-user=USERNAME" >> /etc/lightdm/lightdm.conf.d/60-myconfig.conf </code>

<h3>Provide static IP</h3>
<code> $ sudo vim /etc/network/interfaces </code><br>
Change the line iface etho inet dhcp to the following
auto eth0 <br>
iface eth0 inet static <Br>
address 192.168.1.2 <br>
netmask 255.255.255.0 <br>
gateway 192.168.1.1 <br>

<h3>Maximize power output on USB ports </h3>
<code> $ sudo gedit /boot/config.txt </code> <bR>
Uncomment line # max_usb_current and set it to <bR>
max_usb_current = 1 <br>
<code>$ sudo shutdown -r 0 </code><bR>

<h3> Auto mount hard disk with UUID </h3>
sudo blkid <br>
Copy the UUID <br>
sudo vim /etc/fstab <br>
Append <br>
UUID=<UUID>	/media/fileHDD	ntfs-3g	defaults	0	0 <br>
UUID=<UUID> /media/mediaHDD ntfs-3g defaults	0	0 <br>

