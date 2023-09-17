parent_path=$( cd "$(dirname "$0")" ; pwd -P )

# powerline
pip3 install powerline-status

# .vimrc
ln -s $parent_path/vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -s $parent_path/nvim/init.vim ~/.config/nvim/init.vim
ln -s $parent_path/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# spell
mkdir -p ~/.vim/spell
ln -s $parent_path/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
