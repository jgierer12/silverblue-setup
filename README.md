# Fedora Silverblue Setup

## Features

- Very close to stock Fedora/GNOME setup
- Fully automatic updates for system and flatpak packages
- Minimal rpm-ostree overlays
- Collection of flatpak apps for communication, development, entertainment and more

## Installation

1. Install [Fedora Silverblue](https://docs.fedoraproject.org/en-US/fedora-silverblue/installation/) - probably don't do this on an existing system, just browse the repo and cherry pick if you're interested
2. Make sure you're up to date with `rpm-ostree update` and a reboot if necessary
3. Clone this repo: `git clone https://github.com/jgierer12/silverblue-setup.git`
4. `cd silverblue-setup`
5. Edit `files/flatpaks.list` and `files/rpm-overlays.list` to your liking
6. Run the rpm installation script: `./00-rpm.sh`
7. Get a coffee, and then reboot your computer
8. Run the flatpak installation script: `./01-flatpak.sh`
9. To finish tailscale setup, run `sudo systemctl enable --now tailscaled` and then `sudo tailscale up`

## Todo

- [x] rpm setup
- [x] flatpak setup
- [ ] fonts, GNOME extensions, GNOME tweaks
- [ ] distrobox setup
- [ ] instructions for using vscode with distrobox

## Credits

Inspired by and based on https://github.com/castrojo/ublue
