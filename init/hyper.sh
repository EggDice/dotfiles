parent_path=$( cd "$(dirname "$0")" ; pwd -P )

mkdir -p ~/.config/Hyper/

ln -sf $parent_path/hyper.js ~/.config/Hyper/.hyper.js
