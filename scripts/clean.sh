#!/bin/sh
set -ex

# clear downloaded packages
apt-get clean

# clear journal
journalctl --rotate
journalctl --vacuum-time=1s

# fill disk with zeros
dd if=/dev/zero of=/EMPTY || true
rm -f /EMPTY
