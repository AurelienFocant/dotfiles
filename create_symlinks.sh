#!/bin/bash

dotfile_dir="$HOME/dotfiles"

files="\
rcs_shells	 zshrc
rcs_shells	bashrc
git			gitconfig
vims		vimrc
"

printf "$files" | while read -r subdir file; do
	rm -rf "$HOME/.$file" && ln -sfv "$dotfile_dir/$subdir/$file" "$HOME/.$file"
done

# create symlink for ssh config
mkdir -p $HOME/.ssh
rm -rf $HOME/.ssh/config && ln -sfv "$dotfile_dir/ssh/config" "$HOME/.ssh"

# create symlinks for neovim config
mkdir -p $HOME/.config
rm -rf "$HOME/.config/nvim" && ln -sfv "$dotfile_dir/vims/nvim" "$HOME/.config"
rm -rf "$HOME/.nvimrc" && ln -sfv "$dotfile_dir/vims/nvim/lua" "$HOME/.nvimrc"
