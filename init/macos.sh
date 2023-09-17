#!/bin/sh

# Security

# Check if Terminal has Full Disk Access
if ! ls ~/Downloads &>/dev/null; then
    # Prompt user to give Terminal Full Disk Access
    osascript -e 'display dialog "Please grant Full Disk Access to Terminal in the next window." buttons {"OK"} default button "OK"'
    osascript -e 'tell application "System Preferences"
                    activate
                    set current pane to pane id "com.apple.preference.security"
                    reveal anchor "Privacy_Accessibility" of pane id "com.apple.preference.security"
                  end tell'
    osascript -e 'display dialog "Please add Terminal to the list and grant it Full Disk Access. Then click OK." buttons {"OK"} default button "OK"'
else
    echo "Terminal already has Full Disk Access."
fi

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
brew install --cask messenger
brew install mmv
brew install neovim
brew install node
brew install --cask obs
brew install sl
brew install --cask slack
brew install sox
brew install the_silver_searcher
brew install thefuck
brew install --cask transmission
brew install tmux
brew install tree
brew install --cask wine-stable
brew install --cask whatsapp


# docker

brew install qemu
brew install minikube
brew install docker
brew install docker-compose

minikube start
eval $(minikube docker-env)
echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null
install docker-credential-helper
