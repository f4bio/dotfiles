{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh
sudo apt-get --yes install ripgrep zsh curl git fzf

{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
brew install ripgrep

{{ end -}}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

