parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# lightdm
rm ~/.profile
ln -s $parent_path/../profile ~/.profile
rm ~/.bashrc
ln -s $parent_path/../bashrc ~/.bashrc
