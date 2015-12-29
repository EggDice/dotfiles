e_header 'Update apt'
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Install APT packages.
packages=(
  ansible
  build-essential
  cowsay
  curl
  d
  git
  git-core
  htop
  libssl-dev
  python
  rxvt-unicode-256color
  silversearcher-ag
  sl
  telnet
  tmux
  tree
  ttf-mscorefonts-installer
  vim-nox
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
