#!/usr/bin/env bash

# packages
apps="git tmux keepassxc podman"
utils="wget curl jq ripgrep fd-find build-essential"
sudo apt-get install -y $apps $utils

# config
mkdir -p ~/.config/nvim && ln -s ~/dot/init.lua ~/.config/nvim
mkdir -p ~/.config/tmux && ln -s ~/dot/tmux.conf ~/.config/tmux
echo 'export EDITOR="nvim"; export VISUAL="nvim"' >> ~/.bashrc
sudo ln -s $(which fdfind) /usr/local/bin/fd

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh" # to use nvm without restarting shell

# npm packages
nvm i --lts
npm i -g npm@latest typescript typescript-language-server vscode-langservers-extracted
npm i -g http-server prettier @johnnymorganz/stylua-bin

# neovim
wget -O- https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz | tar xz
sudo mv nvim-linux-x86_64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin

# git
git config --global user.name "kiweo"
git config --global user.email "206985760+kiweo@users.noreply.github.com"
ssh-keygen -t ed25519 -C "206985760+kiweo@users.noreply.github.com" -f ~/.ssh/id_ed25519
