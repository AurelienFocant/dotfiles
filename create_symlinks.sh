#! /bin/bash

dotfile_dir="$HOME/dotfiles"

cd $dotfile_dir || exit

files="zshrc vimrc gitconfig bashrc ssh/config"

for file in $files; do
	ln -sf "$dotfile_dir/$file" "$HOME/.$file"
done

# create symlinks for neovim config
mkdir -p $HOME/.config
ln -sf "$dotfile_dir/nvim" "$HOME/.config/"
ln -sf "$dotfile_dir/nvim" "$HOME/.nvimrc"
