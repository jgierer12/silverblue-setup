#!/bin/bash
set -eu

[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1; }

echo "Configuring automatic system upgrades..."
sudo cp ./files/rpm-ostreed.conf /etc
systemctl enable rpm-ostreed-automatic.timer

echo "Checking base layer..."
while ! rpm-ostree status | grep ^State | grep idle > /dev/null; do
  echo "Waiting for rpm-ostree..."
  sleep 5
done

echo "Removing Firefox from base layer..."
rpm-ostree override remove firefox-langpacks &> /dev/null || true # F37+
rpm-ostree override remove firefox &> /dev/null || true

if [ ! -e /etc/yum.repos.d/tailscale.repo ]; then
    echo "Installing tailscale repo..."
    sudo curl -s https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo > /dev/null
    # Disable repo_gpgcheck, which doesn't work on Silverblue 36+
    sudo sed -i 's/repo_gpgcheck=1/repo_gpgcheck=0/' /etc/yum.repos.d/tailscale.repo
fi

echo "Installing layered packages..."
cat ./files/rpm-overlays.list | rpm-ostree --idempotent install `xargs`
