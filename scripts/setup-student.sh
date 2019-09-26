#!/bin/sh
set -ex
mkdir -p ~/Desktop

cat <<END | dbus-launch dconf load /
[org/mate/screensaver]
idle-activation-enabled=false
lock-enabled=false 

[org/mate/desktop/peripherals/keyboard/kbd]
layouts=['us', 'cz']
options=['grp\tgrp:ctrl_shift_toggle', 'grp\tgrp:win_space_toggle']
END


# install vscode extensions
/snap/bin/code --install-extension ms-vscode.cpptools
/snap/bin/code --install-extension vector-of-bool.cmake-tools

cat <<END > ~/Desktop/UPR.desktop
[Desktop Entry]
Encoding=UTF-8
Name=UPR
Type=Link
URL=https://github.com/geordi/upr-course
Icon=mate-fs-bookmark
END

(
  cd ~/Desktop
  wget -c https://github.com/geordi/upr-course/raw/master/assets/exercises/templates/exercise_01.zip
  unzip -o exercise_01.zip
)
