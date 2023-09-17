parent_path=$( cd "$(dirname "$0")" ; pwd -P )

rm -f ~/.bashrc
ln -s $parent_path/../zshrc ~/.zshrc
rm -f ~/.aliases
ln -s $parent_path/../aliases ~/.aliases
