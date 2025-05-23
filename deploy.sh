#!/usr/bin/env bash

# packages
apps="git tmux irssi keepassxc podman"
c="clang clangd clang-format gdb cmake bear"
utils="wget curl jq ripgrep fd-find build-essential"
sudo apt-get install -y $apps $c $utils

# config
mkdir -p ~/.config/{nvim,tmux} ~/.irssi
ln -s ~/dot/nvim/{init.lua,stylua.toml} ~/.config/nvim
ln -s ~/dot/tmux/tmux.conf ~/.config/tmux
ln -s ~/dot/irssi/{config,pof.theme} ~/.irssi
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

# neovim
wget -O- https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz | tar xz
sudo mv nvim-linux-x86_64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin

# git
git config --global user.name "kiweo"
git config --global user.email "206985760+kiweo@users.noreply.github.com"
ssh-keygen -t ed25519 -C "206985760+kiweo@users.noreply.github.com" -f ~/.ssh/id_ed25519
