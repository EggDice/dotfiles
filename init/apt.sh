sudo dpkg --add-architecture i386
e_header 'Update apt'
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Install APT packages.
packages=(
  acpi
  anki
  arandr
  blueman
  cabal-install
  cowsay
  curl
  default-jre
  default-jdk
  docker.io
  feh
  ffmpeg
  fzf
  gimp
  gnustep-gui-runtime
  htop
  imagemagick
  libnotify-bin
  libsox-fmt-mp3
  libghc-xmonad-contrib-dev
  libghc-xmonad-dev
  lightdm
  mmv
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
  sox
  suckless-tools
  thefuck
  tmux
  transmission
  trayer
  tree
  ttf-mscorefonts-installer
  vim-nox
  nvim
  vlc
  wine
  wine32
  xbacklight
  xclip
  xcompmgr
  xdotool
  xmobar
  xmonad
  zsh
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
sudo cp $parent_path/../preferences /etc/apt/
