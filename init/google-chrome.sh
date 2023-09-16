parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

wget -c wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-*.deb
sudo apt-get -y install -f
rm google-chrome-*.deb

# Disable incognito
sudo mkdir -p /etc/opt/chrome/policies/managed/
sudo ln -s $parent_path/../test_policy.json /etc/opt/chrome/policies/managed/
