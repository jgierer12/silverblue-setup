#!/bin/bash
set -eu

echo "Removing existing image..."
distrobox rm -f fedora-distrobox || true

echo "Building new image..."
podman build -f ./files/fedora-distrobox.Dockerfile -t fedora-distrobox

echo "Creating distrobox..."
distrobox create -i localhost/fedora-distrobox -n fedora-distrobox
