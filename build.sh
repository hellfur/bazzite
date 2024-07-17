#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

# systemctl enable podman.socket

# Install tmff2 driver.
if [[ ! -f /usr/bin/ld ]]; then
  ln -s /usr/bin/ld.bfd /usr/bin/ld
fi
mkdir -p /tmp/hid-tmff2
cd /tmp/hid-tmff2
git clone --recurse-submodules https://github.com/hellfur/hid-tmff2.git
cd hid-tmff2
CURRENT_BAZZITE_KERNEL=`ls /lib/modules`
make all KERNEL_VERSION=$CURRENT_BAZZITE_KERNEL
sudo make install KERNEL_VERSION=$CURRENT_BAZZITE_KERNEL

