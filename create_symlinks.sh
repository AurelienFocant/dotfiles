#!/bin/bash

dotfile_dir="$HOME/dotfiles"

files="\
rcs_shells	 zshrc
rcs_shells	bashrc
git			gitconfig
vims		vimrc
gdb			gdbinit
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

# create symlink for tmux.config
ln -sfv "$dotfile_dir/tmux/conf/tmux.core.conf" "$HOME/.tmux.conf"

# create symlink for starship shell prompt
ln -sfv "$dotfile_dir/starship/starship.toml" "$HOME/.config/starship.toml"

# create symlink for my_scripts directory
ln -sfv "$dotfile_dir/my_scripts" "$HOME/my_scripts"
