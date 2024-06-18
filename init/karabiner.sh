parent_path=$( cd "$(dirname "$0")" ; pwd -P )

mkdir -p ~/.config/karabiner/assets/complex_modifications

ln -s $parent_path/custom_hyper_open.json ~/.config/karabiner/assets/complex_modifications/custom_hyper_open.json
