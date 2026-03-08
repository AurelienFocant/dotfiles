#!/usr/bin/env bash

tmux select-pane -L

if tmux display-message -p "#{pane_current_command}" | grep -q ".*vim"; then
	tmux send-keys 'Escape' ':wincmd b' 'Enter'
fi
