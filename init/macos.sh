#!/bin/sh

# Security

# Check if Terminal has Full Disk Access
if ! ls ~/Library/Safari &>/dev/null; then
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

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask anki

# docker

brew install qemu
brew install minikube
brew install docker
brew install docker-compose

bash minikube start
eval $(minikube docker-env)
echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null
install docker-credential-helper
