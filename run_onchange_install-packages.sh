#!/bin/sh

echo "installing packages..."
sudo apt-get --quiet --yes install zip unzip rar unrar ripgrep asciinema

echo "install 3rd party packages/tools..."
curl -fsSL -o "$HOME/.local/bin/agg" "https://github.com/asciinema/agg/releases/download/v1.4.0/agg-x86_64-unknown-linux-gnu"
chmod +x "$HOME/.local/bin/agg"

echo "install zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

echo "installing nerd fonts..."
LOCAL_FONTS="$HOME/.local/share/fonts"
mkdir -p "$LOCAL_FONTS"
curl -fsSL -o "/tmp/Hack.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip"
curl -fsSL -o "/tmp/FiraCode.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
unzip -qq -d /tmp/Hack /tmp/Hack.zip
unzip -qq -d /tmp/FiraCode /tmp/FiraCode.zip
cp "/tmp/Hack/Hack Regular Nerd Font Complete.ttf" "$LOCAL_FONTS/"
cp "/tmp/Hack/Hack Regular Nerd Font Complete Mono.ttf" "$LOCAL_FONTS/"
cp "/tmp/FiraCode/Fira Code Regular Nerd Font Complete.ttf" "$LOCAL_FONTS/"
cp "/tmp/FiraCode/Fira Code Regular Nerd Font Complete Mono.ttf" "$LOCAL_FONTS/"
fc-cache -f

echo "do something else..."
