sudo dpkg --add-architecture i386
e_header 'Update apt'
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Install APT packages.
packages=(
  acpi
  anki
  arandr
  cowsay
  curl
  default-jre
  default-jdk
  docker.io
  feh
  ffmpeg
  htop
  imagemagick
  libnotify-bin
  lightdm
  mplayer
  network-manager-gnome
  notify-osd
  obs-studio
  python-pip
  python3-pip
  redshift-gtk
  rxvt-unicode-256color
  silversearcher-ag
  sl
  suckless-tools
  stalonetray
  tmux
  transmission
  ttf-mscorefonts-installer
  vim-nox
  vlc
  wine
  wine32
  xbacklight
  xclip
  xcompmgr
  xdotool
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

sudo chown -R eggdice /usr/local/
