# INSTALLING Serviio on Ubuntu
# Install Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

# Install dependencies
sudo add-apt-repository -y ppa:kirillshkrogalev/ffmpeg-next
sudo apt-get update
sudo apt-get install -y ffmpeg
sudo apt-get -y install dcraw
sudo apt-get -y install libavcodec-extra-53 
sudo apt-get -y install libavformat-extra-53

# Serviio Media Server
wget http://download.serviio.org/releases/serviio-1.5.2-linux.tar.gz
tar zxvf serviio-1.5.2-linux.tar.gz
rm serviio-1.5.2-linux.tar.gz
sudo mv serviio-1.5.2 /usr/local/share/serviio-1.5.2
chown -R $USER:$USER /usr/local/share/serviio-1.5.2

# Autostart on startup
sudo touch /lib/systemd/system/serviio.service
sudo echo “[Unit]
Description=Serviio Media Server
After=syslog.target network.target

[Service]
Type=simple
User=$USER
ExecStart=/usr/local/share/serviio-1.5.2/bin/serviio.sh
KillMode=none
Restart=on-abort

[Install]
WantedBy=multi-user.target” > /lib/systemd/system/serviio.service

systemctl daemon-reload
systemctl enable serviio
systemctl start serviio
