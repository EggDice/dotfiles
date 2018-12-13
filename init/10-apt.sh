sudo dpkg --add-architecture i386
e_header 'Update apt'
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Install APT packages.
packages=(
  cowsay
  curl
  default-jre
  default-jdk
  docker.io
  feh
  ffmpeg
  htop
  mplayer
  python-pip
  python3-pip
  rxvt-unicode-256color
  silversearcher-ag
  sl
  suckless-tools
  stalonetray
  tmux
  ttf-mscorefonts-installer
  vim-nox
  wine
  wine32
  xmonad
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
    e_success "$package"
  done
fi

sudo chown -R egg /usr/local/
