#!/bin/sh

# Brew

if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/eggdice/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    sourche ~/.zprofile
else
    echo "Homebrew already installed."
fi

# Brew Packages

brew install --cask amethyst
brew install --cask anki
brew install coreutils
brew install cowsay
brew install deno
brew install --cask discord
brew install --cask dosbox-x
brew install ffmpeg
brew install fzf
brew install --cask google-chrome
brew install gimp
brew install --cask hyper
brew install htop
brew install imagemagick
brew install --cask iina
brew install --cask karabiner-elements
brew install --cask messenger
brew install mmv
brew install neovim
brew install node
brew install --cask obs
brew install --cask skype
brew install sl
brew install --cask slack
brew install sox
brew install --cask steam
brew install the_silver_searcher
brew install thefuck
brew install --cask transmission
brew install tmux
brew install tree
brew install --cask wine-stable
brew install --cask whatsapp
brew install --cask zoom

# docker

brew install qemu
brew install minikube
brew install docker
brew install docker-compose

minikube start

if ! grep -q "$(minikube ip) docker.local" /etc/hosts; then
  echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null
fi

