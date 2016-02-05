dpkg --add-architecture i386
e_header 'Update apt'
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Install APT packages.
packages=(
  ansible
  build-essential
  cowsay
  curl
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
  transmission
  tree
  ttf-mscorefonts-installer
  vim-nox
  wine
  wine32
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
    e_success "$package"
  done
fi
