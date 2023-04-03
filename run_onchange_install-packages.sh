#!/bin/sh

sudo apt install ripgrep
mkdir -p $HOME/.local/share/fonts
curl -fLo "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf"
curl -fLo "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
cd /tmp
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack
./install.sh FiraCode
