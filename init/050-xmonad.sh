parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# xmonad
mkdir -p ~/.xmonad
ln -s $parent_path/../xmonad/xmonad.hs ~/.xmonad/xmonad.hs
ln -s $parent_path/../xmonad/background.png ~/.xmonad/background.png
ln -s $parent_path/../xsessionrc ~/.xsessionrc

# battery

ln -s $parent_path/../xmonad/crontab ~/.xmonad/crontab
ln -s $parent_path/../xmonad/battery /usr/local/bin
ln -s $parent_path/../xmonad/battery-alert /usr/local/bin
crontab -u eggdice ~/.xmonad/crontab
