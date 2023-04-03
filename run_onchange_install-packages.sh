#!/bin/sh

sudo apt install ripgrep
mkdir -p $HOME/.local/share/fonts

cd /tmp
curl -fsSL -O "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh"
curl -fsSL -O "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf"
curl -fsSL -O "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
./install.sh Hack
./install.sh FiraCode
