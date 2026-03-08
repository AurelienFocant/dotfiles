#!/usr/bin/env bash

tmux select-pane -R

if tmux display-message -p "#{pane_current_command}" | grep -q ".*vim"; then
	tmux send-keys 'Escape' ':wincmd t' 'Enter'
fi
