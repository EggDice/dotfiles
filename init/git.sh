parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

ssh-keygen -t ed25519 -C "tamas.kokeny.87@gmail.com"

echo "copy this to GitHub:"
cat ~/.ssh/id_ed25519.pub
read -p "Press enter if done"

# giconfig
ln -s $parent_path/../gitconfig ~/.gitconfig
