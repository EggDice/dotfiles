parent_path=$( cd "$(dirname "$0")" ; pwd -P )

mkdir -p ~/.config/kitty

ln -sf $parent_path/kitty.conf ~/.config/kitty/kitty.conf
