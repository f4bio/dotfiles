#!/bin/sh

echo "installing packages..."
sudo apt-get --quiet --yes install ripgrep asciinema

echo "installing nerd fonts..."
mkdir -p "$HOME/.local/share/fonts"
curl -fsSL -o "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack Regular Nerd Font Complete.ttf"
curl -fsSL -o "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack Regular Nerd Font Complete Mono.ttf"
fc-cache -f

echo "do something else..."
