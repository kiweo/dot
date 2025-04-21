#!/usr/bin/env bash

# packages
apps="git tmux irssi keepassxc"
c="clang clangd clang-format gdb cmake bear"
utils="wget curl jq ripgrep fd-find build-essential"
sudo apt-get install -y $apps $c $utils

# config
mkdir -p ~/.config/nvim && cp init.lua ~/.config/nvim
mkdir -p ~/.config/tmux && cp tmux.conf ~/.config/tmux
mkdir ~/.irssi && cp config pof.theme ~/.irssi
echo 'export EDITOR="nvim"; export VISUAL="nvim"' >> ~/.bashrc
sudo ln -s $(which fdfind) /usr/local/bin/fd

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# npm packages
nvm i v22.14.0
npm i -g npm@latest typescript typescript-language-server vscode-langservers-extracted
npm i -g http-server prettier @johnnymorganz/stylua-bin

# git
git config --global user.name "kiweo"
git config --global user.email "206985760+kiweo@users.noreply.github.com"
ssh-keygen -t ed25519 -C "206985760+kiweo@users.noreply.github.com" -f ~/.ssh/id_ed25519

# libera
read -s -p "libera password? " liberapassword
sed -i "s|PASSWORD|$liberapassword|g" ~/.irssi/config

# neovim
wget https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin
nvim
