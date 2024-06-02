#!/bin/bash

# dependencies
# - ripgrep
# - make (fzf)

if [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm --needed git make ripgrep
fi

if [ -d ~/.config/nvim ]; then
    rm -rf ~/.config/nvim.bak
    mv ~/.config/nvim ~/.config/nvim.bak
fi

ln -sf ~/.dotfiles/nvim ~/.config/nvim
