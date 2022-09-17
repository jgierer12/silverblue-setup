#!/bin/bash
set -eu

[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1; }

rm -rf /tmp/fonts
mkdir -p /tmp/fonts

echo "Installing Inter..."
curl -Lo /tmp/fonts/inter.zip $(curl -sL https://api.github.com/repos/rsms/inter/releases/latest | jq -r '.assets[0].browser_download_url')
unzip -q /tmp/fonts/inter.zip -d /tmp/fonts/inter
mkdir -p "/usr/local/share/fonts/Inter"
cp -r "/tmp/fonts/inter/Inter Desktop"/* "/usr/local/share/fonts/Inter"

echo "Installing JetBrains Mono..."
curl -Lo /tmp/fonts/jbm.zip $(curl -sL https://api.github.com/repos/JetBrains/JetBrainsMono/releases/latest | jq -r '.assets[0].browser_download_url')
unzip -q /tmp/fonts/jbm.zip -d /tmp/fonts/jbm
mkdir -p "/usr/local/share/fonts/JetBrains Mono"
cp -r "/tmp/fonts/jbm/fonts/ttf"/* "/usr/local/share/fonts/JetBrains Mono"

fc-cache
rm -rf /tmp/fonts
