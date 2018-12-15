wget -c wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-*.deb
sudo apt-get -y install -f
rm google-chrome-*.deb

# Disable incognito
mkdir -p /etc/opt/chrome/policies/managed/
ln -s $parent_path/../test_policy.json /etc/opt/chrome/policies/managed/

# hosts-file
sudo rm /etc/hosts
ln -s $parent_path/../hosts /etc/hosts

