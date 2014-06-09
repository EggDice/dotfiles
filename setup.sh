# packages
sudo apt-get install aptitude
sudo aptitude update
sudo aptitude upgrade
sudo aptitude install -y vim git tmux
sudo aptitude install lightdm i3
sudo aptitude install -y ttf-mscorefonts-installer rxvt-unicode-256color
sudo aptitude install -y nodejs
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node
sudo aptitude install -y acpitool
sudo aptitude install -y docker.io

# Google Chrome
wget -c wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-*.deb
sudo apt-get -y install -f
rm google-chrome-*.deb

# WiFi
sudo aptitude install -y linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
sudo modprobe -r b44 b43 b43legacy ssb brcmsmac
sudo modprobe wl
sudo usermod -G netdev -a egg

# Desktop
mkdir -p ~/video
mkdir -p ~/pictures
mkdir -p ~/downloads 
mkdir -p ~/music
mkdir -p ~/projects
mkdir -p ~/brickflow

# TrackPoint
sudo aptitude install xinput
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
