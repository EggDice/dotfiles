# packages
sudo apt-get install aptitude
sudo aptitude update
sudo aptitude upgrade
sudo aptitude install -y vim git tmux
sudo aptitude install lightdm i3
sudo aptitude install -y nodejs

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
mkdir video
mkdir pictures
mkdir downloads 
mkdir music
mkdir projects
mkdir brickflow
