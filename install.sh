#!/usr/bin/env zsh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# homebrew packages
brew install git tmux fnm wget curl jq ripgrep fd fzf unzip
brew install neovim --HEAD
brew install --cask firefox keepassxc

# link configs
mkdir -p ~/.config/nvim && ln -s ~/dot/init.lua ~/.config/nvim/init.lua
mkdir -p ~/.config/tmux && ln -s ~/dot/tmux.conf ~/.config/tmux/tmux.conf

# setup fzf
$(brew --prefix)/opt/fzf/install --all

# setup fnm & nodejs
eval "$(fnm env --use-on-cd --shell zsh)"
fnm i --lts

# npm packages
npm i -g npm@latest typescript typescript-language-server vscode-langservers-extracted
npm i -g http-server prettier @johnnymorganz/stylua-bin

# git
git config --global user.name "kiweo"
git config --global user.email "206985760+kiweo@users.noreply.github.com"
ssh-keygen -t ed25519 -C "206985760+kiweo@users.noreply.github.com" -f ~/.ssh/id_ed25519
