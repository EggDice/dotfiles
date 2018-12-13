parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# lightdm
sudo ln -s $parent_path/../lightdm.conf /etc/lightdm/lightdm.conf.d/lightdm.conf

gsettings set org.gnome.desktop.screensaver lock-enabled false
