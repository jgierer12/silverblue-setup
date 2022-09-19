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
6. Run the rpm installation script:
   1. `./00-rpm.sh`
   2. Get a coffee, and then reboot your computer
   3. To finish tailscale setup, run `sudo systemctl enable --now tailscaled` and then `sudo tailscale up`
7. Run the rest of the installation scripts:
   1. `./01-flatpak.sh`
   2. `./02-distrobox.sh`

## Automatic updates

Both rpm-ostree and flatpaks are regularly updated automatically, which means the system requires close to zero maintenance. Silverblue creates a backup snapshot before every rpm-ostree upgrade, so if there is a problem, you can usually fix it by rebooting into an older snapshot.

rpm-ostree requires a reboot to apply staged upgrades. It is recommended to shutdown or reboot somewhat regularly. Personally I shut down my PCs every evening.

To preview staged rpm-ostree upgrades, run `rpm-ostree status -v`. To see a history of recently updated flatpaks, run `journalctl -u flatpak-automatic.service --reverse`.

## Todo

- [x] rpm setup
- [x] flatpak setup
- [x] fonts
- [ ] config files
- [ ] GNOME extensions
- [ ] GNOME tweaks
- [x] distrobox setup
- [ ] instructions for using vscode with distrobox

## Credits

Inspired by and based on https://github.com/castrojo/ublue
