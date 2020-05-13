parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# lightdm
rm -f ~/.profile
ln -s $parent_path/../profile ~/.profile
rm -f ~/.bashrc
ln -s $parent_path/../bashrc ~/.bashrc
rm -f ~/.aliases
ln -s $parent_path/../aliases ~/.aliases
