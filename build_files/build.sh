#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable lionheartp/Hyprland
dnf5 -y copr enable erikreider/SwayNotificationCenter

dnf5 install -y \
  aquamarine \
  gnome-keyring \
  fuzzel \
  hyprcursor \
  hyprgraphics \
  hypridle \
  hyprland \
  hyprland-guiutils \
  hyprland-qt-support \
  hyprlang \
  hyprlock \
  hyprpaper \
  hyprpicker \
  hyprpolkitagent \
  hyprpwcenter \
  hyprqt6engine \
  hyprshutdown \
  hyprsunset \
  hyprsysteminfo \
  hyprtoolkit \
  hyprutils \
  hyprwayland-scanner \
  seahorse \
  SwayNotificationCenter \
  xdg-desktop-portal-hyprland \
  waybar wl-clipboard wofi

dnf5 remove -y \
  plasma-desktop \
  plasma-workspace \
  plasma-workspace-wayland \
  plasmashell \
  kwin \
  kwin-wayland \
  systemsettings \
  kde-cli-tools \
  xdg-desktop-portal-kde

dnf5 install -y sddm
dnf5 install -y qt6-qtwayland

dnf5 -y copr disable lionheartp/Hyprland
dnf5 -y copr disable erikreider/SwayNotificationCenter

#### Example for enabling a System Unit File

systemctl enable podman.socket sddm.service
