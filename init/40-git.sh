parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# giconfig
ln -s $parent_path/../gitconfig ~/.gitconfig
