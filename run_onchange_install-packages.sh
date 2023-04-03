#!/bin/sh

echo "\n\n## ####################"
echo "## starting onchange install packages..."
echo "## ################\n\n"

echo "\n## ####################"
echo "## installing packages..."
echo "## ################\n"
sudo apt-get --quiet --yes install zip unzip rar unrar ripgrep asciinema

echo "\n## ####################"
echo "## install 3rd party packages/tools..."
echo "## ################\n"
curl -fsSL -o "$HOME/.local/bin/agg" "https://github.com/asciinema/agg/releases/download/v1.4.0/agg-x86_64-unknown-linux-gnu"
chmod +x "$HOME/.local/bin/agg"

echo "\n## ####################"
echo "## install zsh plugins..."
echo "## ################\n"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

echo "\n## ####################"
echo "## installing nerd fonts..."
echo "## ################\n"
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

echo "\n## ####################"
echo "## do something else..."
echo "## ################\n"

echo "\n\n## ####################"
echo "## done onchange install packages..."
echo "## ################\n\n"
