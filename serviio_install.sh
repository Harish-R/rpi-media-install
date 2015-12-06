# INSTALLING Serviio on Ubuntu

# Install dependencies
sudo apt-get -y install ffmpeg
sudo apt-get -y install dcraw
sudo apt-get -y install libavcodec-extra-53 
sudo apt-get -y install libavformat-extra-53

# Install Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y install oracle-java8-installer

# Download Serviio-1.5.2 and Install
sudo su
cd /opt
wget http://download.serviio.org/releases/serviio-1.5.2-linux.tar.gz
tar zxvf serviio-1.5.2-linux.tar.gz
rm serviio-1.5.2-linux.tar.gz
ln -s serviio-1.5.2 serviio
chown -R root:root serviio-1.5.2
cd serviio-1.5.2
mkdir log
chown -R $USER:$USER library log

#Configure serviio service
sudo touch /lib/systemd/system/serviio.service
sudo echo "[Unit]
Description=Serviio Media Server
After=syslog.target local-fs.target network.target

[Service]
Type=simple
User=serviio
Group=serviio
ExecStart=/opt/serviio/bin/serviio.sh
ExecStop=/opt/serviio/bin/serviio.sh -stop
KillMode=none
Restart=on-abort

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/serviio.service

# Enable service at system startup
sudo systemctl daemon-reload
sudo systemctl enable serviio
sudo systemctl start serviio