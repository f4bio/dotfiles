#!/bin/sh

echo "installing packages..."
sudo apt-get --quiet --yes install ripgrep asciinema

echo "installing nerd fonts..."
LOCAL_FONTS="$HOME/.local/share/fonts"
mkdir -p "$LOCAL_FONTS"
curl -fsSL -o "$LOCAL_FONTS/Hack Regular Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf"
curl -fsSL -o "$LOCAL_FONTS/Hack Regular Nerd Font Complete Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
fc-cache -f

echo "do something else..."
