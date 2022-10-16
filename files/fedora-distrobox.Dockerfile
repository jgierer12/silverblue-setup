FROM fedora:36

RUN dnf upgrade -y

# shell and prompt
RUN dnf install -y util-linux-user langpacks-en fish flatpak-spawn
RUN chsh -s /usr/bin/fish
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# development
RUN dnf install -y git gh nodejs golang

# misc tools
RUN dnf install -y bat exa fd-find ripgrep fzf btop bmon neofetch jq neovim mosh xclip qrencode
