parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Backlight
sudo ln -s $parent_path/../xorg.conf /etc/X11/xorg.conf
