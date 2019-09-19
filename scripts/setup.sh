#!/bin/sh
set -ex
apt-get install -y \
  ubuntu-mate-core \
  firefox \
  git \
  vim \
  binutils \
  make \
  gcc \
  g++ \
  gdb \
  cmake \
  virtualbox-guest-dkms \
  virtualbox-guest-x11 \
  virtualbox-guest-utils

cat <<END > /etc/lightdm/lightdm.conf.d/autologin.conf
[SeatDefaults]
autologin-user=student
END

snap install code --classic
