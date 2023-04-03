#!/bin/sh

# echo "\n## ####################"
# echo "## starting onchange install packages..."
# echo "## ################\n"

# echo "\n## ####################"
# echo "## installing packages..."
# echo "## ################\n"
sudo apt-get --quiet --yes install zip unzip rar unrar ripgrep asciinema tmux git curl

# echo "\n## ####################"
# echo "## install 3rd party packages/tools..."
# echo "## ################\n"
curl -fsSL -o "$HOME/.local/bin/agg" "https://github.com/asciinema/agg/releases/download/v1.4.0/agg-x86_64-unknown-linux-gnu"
chmod +x "$HOME/.local/bin/agg"
if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.3
fi
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-20
asdf global java openjdk-20

# echo "\n## ####################"
# echo "## install zsh plugins..."
# echo "## ################\n"
if [ ! -d "$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi
if [ ! -d "$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi
if [ ! -d "$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# echo "\n## ####################"
# echo "## installing nerd fonts..."
# echo "## ################\n"
mkdir -p "$HOME/.local/share/fonts"
curl -fsSL -o "/tmp/Hack.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip"
curl -fsSL -o "/tmp/FiraCode.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
unzip -qq -o -d /tmp/Hack /tmp/Hack.zip
unzip -qq -o -d /tmp/FiraCode /tmp/FiraCode.zip
cp "/tmp/Hack/Hack Regular Nerd Font Complete.ttf" "$HOME/.local/share/fonts/"
cp "/tmp/Hack/Hack Regular Nerd Font Complete Mono.ttf" "$HOME/.local/share/fonts/"
cp "/tmp/FiraCode/Fira Code Regular Nerd Font Complete.ttf" "$HOME/.local/share/fonts/"
cp "/tmp/FiraCode/Fira Code Regular Nerd Font Complete Mono.ttf" "$HOME/.local/share/fonts/"
fc-cache -f

# echo "\n## ####################"
# echo "## do something else..."
# echo "## ################\n"

# echo "\n## ####################"
# echo "## done onchange install packages..."
# echo "## ################\n"
