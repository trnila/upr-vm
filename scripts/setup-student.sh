#!/bin/sh
set -ex
mkdir -p ~/Desktop

cat <<END | dbus-launch dconf load /
[org/gnome/desktop/screensaver]
lock-enabled=false

[org/gnome/desktop/input-sources]
sources=[('xkb', 'us'), ('xkb', 'cz+qwerty')]

[org/gnome/shell]
favorite-apps=['firefox.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'org.gnome.Nautilus.desktop', 'matrix.desktop', 'kelvin.desktop', 'skripta.desktop']
END


# install vscode extensions
code --install-extension ms-vscode.cpptools

(
  cd ~/Desktop
  wget -c https://github.com/geordi/upr-course/raw/master/assets/exercises/templates/helloworld.zip
  unzip -o helloworld.zip
  rm helloworld.zip
)
