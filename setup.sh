#!/bin/bash

if command -v git &> /dev/null
then
    echo "Git is already installed."
else
    echo "Git is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install git
    echo "Git has been installed."
fi

if command -v nvim &> /dev/null
then
    echo "Neovim is already installed."
else
    echo "Neovim is not installed. Building from source..."
    sudo apt-get update
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
    git clone https://github.com/neovim/neovim.git
    cd neovim
    git checkout release-0.8
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd
    echo "Neovim has been installed."
fi

echo "Installing Astrovim."
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/jslucas/astrovim_config ~/.config/nvim/lua/user

