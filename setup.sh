# packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y tmux curl
sudo apt-get install -y ttf-mscorefonts-installer rxvt-unicode-256color
sudo apt-get install -y docker.io
sudo apt-get install default-jre default-jdk
sudo apt-get install mplayer

# powerline
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

# vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=21650' > ~/.vim/autoload/pathogen.vim
pushd ~/.vim/bundle/
git clone https://github.com/scrooloose/syntastic.git
popd
