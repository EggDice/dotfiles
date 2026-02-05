parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# powerline
pip3 install powerline-status

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
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
pushd ~/.vim/bundle/
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/szorfein/darkest-space
git clone https://github.com/bkad/CamelCaseMotion
popd

# plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# .vimrc
ln -s $parent_path/../vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -s $parent_path/../nvim/init.lua ~/.config/nvim/init.lua
ln -s $parent_path../nvim/coc-settings.json ~/.config/nvim/coc-settings.json
mkdir ~/.config/nvim/lua/config -p
ln -s $parent_path/../nvim/lua/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua
ln -s $parent_path/../nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

# spell
mkdir -p ~/.vim/spell
ln -s $parent_path/../spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
