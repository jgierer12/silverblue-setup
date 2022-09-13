#!/bin/bash
set -eu

[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1; }

echo "Configuring automatic flatpak upgrades..."
sudo cp ./files/flatpak-automatic.service /etc/systemd/system
sudo cp ./files/flatpak-automatic.timer /etc/systemd/system
systemctl daemon-reload
systemctl enable /etc/systemd/system/flatpak-automatic.timer

echo "Enabling FlatHub..."
flatpak remote-modify --disable fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub

echo "Installing Flatpaks..."
cat ./files/flatpaks.list | flatpak install flathub --assumeyes --noninteractive --reinstall `xargs`
