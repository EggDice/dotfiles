parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# udiskie
sudo apt-get -qq install python-setuptools python-pip python-gobject python-yaml libgio2.0 gobject-introspection libgtk2.0-0 libnotify4 gettext gir1.2-notify-0.7
sudo pip install udiskie

