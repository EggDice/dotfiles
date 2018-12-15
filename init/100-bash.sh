parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# lightdm
sudo ln -s $parent_path/../profile ~/.profile
sudo ln -s $parent_path/../bashrc ~/.bashrc
