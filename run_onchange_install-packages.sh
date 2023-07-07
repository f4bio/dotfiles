#!/bin/sh

# essential packages
sudo apt-get --quiet --yes update
sudo apt-get --quiet --yes install \
    zip \
    unzip \
    rar \
    unrar \
    tmux \
    zsh \
    git \
    curl \
    ripgrep \
    asciinema \
    neovim \
    detox

# 3rd party packages/tools
## asdf
if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
fi
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-20
asdf global java openjdk-20

## oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    CHSH="no"
    RUNZSH="no"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

### oh-my-zsh plugins...
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# nerd fonts
if [ ! -d "$HOME/.local/share/fonts" ]; then
    mkdir -p "$HOME/.local/share/fonts"
    NERD_FONTS_VERSION=$(curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep "tag_name" | cut -d\" -f4)
    curl -fsSL -o "/tmp/Hack.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_VERSION/Hack.zip"
    curl -fsSL -o "/tmp/FiraCode.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_VERSION/FiraCode.zip"
    unzip -qq -o -d /tmp/Hack /tmp/Hack.zip
    unzip -qq -o -d /tmp/FiraCode /tmp/FiraCode.zip
    cp "/tmp/Hack/Hack Regular Nerd Font Complete.ttf" "$HOME/.local/share/fonts/"
    cp "/tmp/Hack/Hack Regular Nerd Font Complete Mono.ttf" "$HOME/.local/share/fonts/"
    cp "/tmp/FiraCode/Fira Code Regular Nerd Font Complete.ttf" "$HOME/.local/share/fonts/"
    cp "/tmp/FiraCode/Fira Code Regular Nerd Font Complete Mono.ttf" "$HOME/.local/share/fonts/"
    fc-cache -f
fi
