# miniDLNA Installation Script (Global - all users)
# Verified on Ubuntu 15.10
# Author: Harish R

# Install miniDLNA
sudo apt-get -y install minidlna

# Configure miniDLNA
sudo echo "media_dir=A,/media/mediahdd/MEDIA/Music    # Use A, P, and V to restrict media 'type' in directory
media_dir=P,/media/mediahdd/MEDIA/Pictures
media_dir=V,/media/mediahdd/MEDIA/Videos
media_dir=V,/media/mediahdd/MEDIA/Movies
friendly_name=miniDLNA
db_dir=/var/cache/minidlna      # Needs to be un-commented
log_dir=/var/log                # Needs to be un-commented
inotify=yes                     # 'no' for less resources, restart required for new media
media_dir=/var/lib/minidlna
port=8200
serial=681019810597110
album_art_names=Cover.jpg/cover.jpg/AlbumArtSmall.jpg/albumartsmall.jpg
album_art_names=AlbumArt.jpg/albumart.jpg/Album.jpg/album.jpg
album_art_names=Folder.jpg/folder.jpg/Thumb.jpg/thumb.jpg
" > /etc/minidlna.conf

# Restart service to apply changes
sudo service minidlna restart

# Reaload the library media database
sudo service minidlna force-reload

# Auto-Start service on system start up
touch  ~/.config/autostart/minidlna.desktop

#Configure serviio service
sudo touch /lib/systemd/system/minidlna.service
sudo echo "[Unit]
Description=Serviio Media Server
After=syslog.target local-fs.target network.target

[Service]
Type=simple
User=serviio
Group=serviio
ExecStart=service minidlna start
ExecStop=service minidlna stop
KillMode=none
Restart=on-abort

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/minidlna.service

# Enable service at system startup
sudo systemctl daemon-reload
sudo systemctl enable minidlna
sudo systemctl start minidlna