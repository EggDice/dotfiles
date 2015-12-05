# packages
sudo apt-get install aptitude
sudo aptitude update
sudo aptitude upgrade
sudo aptitude install -y vim-nox git tmux curl
sudo aptitude install -y mercurial
sudo aptitude install lightdm i3
sudo aptitude install -y ttf-mscorefonts-installer rxvt-unicode-256color unzip
sudo aptitude install -y nodejs npm ssh
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node
sudo aptitude install -y acpitool
sudo aptitude install -y docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
sudo aptitude install mongodb
sudo aptitude install default-jre default-jdk
sudo aptitude install transmission vlc mplayer moc

sudo aptitude install ruby-dev
sudo aptitude install python
sudo aptitude install python-pip
pip install --user git+git://github.com/Lokaltog/powerline

mkdir -p ~/.fonts
curl 'www.vim.org/scripts/download_script.php?src_id=21650' > ~/.fonts/PowerlineSymbols.otf
fc-cache -vf ~/.fonts
curl 'https://github.com/Lokaltog/powerline-fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf' > ~/.fonts/DejaVu\ Sans\ Mono\ for\ Powerline.ttf
fc-cache -vf ~/.fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
cp 10-powerline-symbols.conf  ~/.config/fontconfig/conf.d/
rm 10-powerline-symbols.conf

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

# vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=21650' > ~/.vim/autoload/pathogen.vim
pushd ~/.vim/bundle/
git clone https://github.com/scrooloose/syntastic.git
popd
sudo chown -R $USER /usr/local
npm install -g jshint
npm install -g grunt-cli
gem install tmuxinator
gem install lolcommits
