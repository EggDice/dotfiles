parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# xmonad
mkdir -p ~/.xmonad
ln -s $parent_path/../xmonad/xmonad.hs ~/.xmonad/xmonad.hs
ln -s $parent_path/../xmonad/background.png ~/.xmonad/background.png
