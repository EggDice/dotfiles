parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Install font
git clone https://github.com/ryanoasis/nerd-fonts /var/tmp/nerd-fonts
pushd /var/tmp/nerd-fonts
./install.sh Terminus
popd
rm -rf /var/tmp/nerd-fonts

