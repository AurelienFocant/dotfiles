#!/usr/bin/env bash

# Find the leftmost pane
leftmost=$(tmux list-panes -F "#{pane_index} #{pane_left}" | sort -nk2 | head -1 | cut -d' ' -f1)

# Focus the leftmost pane
tmux select-pane -t "$leftmost"

# If that pane is running Vim, send M-t to Vim
if tmux list-panes -F "#{pane_current_command}" -t "$leftmost" | grep -iq 'vim'; then
	tmux send-keys -t "$rightmost" 'Escape' '' ':wincmd t' 'Enter'
fi
