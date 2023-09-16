parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

sudo groupadd docker
sudo usermod -aG docker eggdice

