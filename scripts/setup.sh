#!/bin/sh
set -ex
apt-get install -y \
  ubuntu-desktop-minimal \
  language-pack-cs \
  firefox \
  git \
  vim \
  nano \
  binutils \
  make \
  gcc \
  g++ \
  gdb \
  cmake \
  xxd \
  htop \
  libsdl2-ttf-dev \
  libsdl2-dev \
  libsdl2-image-dev \
  virtualbox-guest-dkms \
  virtualbox-guest-x11 \
  virtualbox-guest-utils

cat <<END > /etc/gdm3/custom.conf
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=student
END

apt-get -y remove gnome-initial-setup

# Install code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
rm packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get -y install apt-transport-https
apt-get update
apt-get -y install code

apt-get -y upgrade
