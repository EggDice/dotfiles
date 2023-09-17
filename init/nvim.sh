parent_path=$( cd "$(dirname "$0")" ; pwd -P )

# powerline
pip3 install powerline-status

# Plug
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Colorscheme
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
pushd ~/.vim/bundle/
git clone https://github.com/szorfein/darkest-space
popd

# .vimrc
ln -s $parent_path/vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -s $parent_path/nvim/init.vim ~/.config/nvim/init.vim
ln -s $parent_path/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# spell
mkdir -p ~/.vim/spell
ln -s $parent_path/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
