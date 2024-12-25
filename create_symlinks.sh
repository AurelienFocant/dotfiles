#!/bin/bash

dotfile_dir="$HOME/dotfiles"

cd $dotfile_dir || exit

files="zshrc vimrc gitconfig bashrc ssh/config"

for file in $files; do
	ln -sfv "$dotfile_dir/$file" "$HOME/.$file"
done

# create symlinks for neovim config
mkdir -p $HOME/.config
rm -rf "$HOME/.config/nvim" && ln -sfv "$dotfile_dir/nvim" "$HOME/.config"
rm -rf "$HOME/.nvimrc" && ln -sfv "$dotfile_dir/nvim/lua" "$HOME/.nvimrc"
