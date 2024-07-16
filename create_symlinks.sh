#! /bin/bash

dotfile_dir="$HOME/dotfiles"

cd $dotfile_dir || exit

files="zshrc vimrc gitconfig bashrc ssh/config"

for file in $files; do
	ln -sf "$dotfile_dir/$file" "$HOME/.$file"
done
