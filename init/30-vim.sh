parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

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

# vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=21650' > ~/.vim/autoload/pathogen.vim
pushd ~/.vim/bundle/
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/szorfein/darkest-space
popd

# .vimrc
ln -s $parent_path/../vimrc ~/.vimrc

# spell
mkdir -p ~/.vim/spell
ln -s $parent_path/../spell ~/.vim/spell/en.utf-8.add
