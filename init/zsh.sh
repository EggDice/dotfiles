parent_path=$( cd "$(dirname "$0")" ; pwd -P )

rm -f ~/.zshrc
ln -s $parent_path/zshrc ~/.zshrc
rm -f ~/.aliases
ln -s $parent_path/aliases ~/.aliases
