parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# hosts-file
sudo rm /etc/hosts
sudo cp $parent_path/../hosts /etc/hosts
curl https://raw.githubusercontent.com/4skinSkywalker/anti-porn-hosts-file/master/HOSTS.txt | sudo tee -a /etc/hosts > /dev/null
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts | sudo tee -a /etc/hosts > /dev/null
