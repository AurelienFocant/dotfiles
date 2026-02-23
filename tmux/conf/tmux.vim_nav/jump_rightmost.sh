#!/usr/bin/env bash

# Find the rightmost pane
rightmost=$(tmux list-panes -F "#{pane_index} #{pane_right}" | sort -nrk2 | head -1 | cut -d' ' -f1)

# Focus the rightmost pane
tmux select-pane -t "$rightmost"

# If that pane is running Vim, send M-t to Vim
if tmux list-panes -F "#{pane_index} #{pane_current_command}" |  awk -v x=$rightmost '$1 == x' | grep -iq 'vim'; then
	tmux send-keys -t "$rightmost" 'Escape' '' ':wincmd b' 'Enter'
fi
