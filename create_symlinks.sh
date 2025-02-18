#!/bin/bash

dotfile_dir="$HOME/dotfiles"

cd $dotfile_dir || exit

files="\
rcs_shells	 zshrc
rcs_shells	bashrc
git			gitconfig
vims		vimrc
ssh			ssh/config"

printf "$files" | while read -r subdir file; do
	ln -sfv "$dotfile_dir/$subdir/$file" "$HOME/.$file"
done

# create symlinks for neovim config
mkdir -p $HOME/.config
rm -rf "$HOME/.config/nvim" && ln -sfv "$dotfile_dir/vims/nvim" "$HOME/.config"
rm -rf "$HOME/.nvimrc" && ln -sfv "$dotfile_dir/vims/nvim/lua" "$HOME/.nvimrc"
