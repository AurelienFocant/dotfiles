########################################################
alias python=python3
alias pip=pip3

########################################################
alias ls="ls -l -h -G -D \"\"" 
alias ll="ls -a -l -G -h -D \"\""
alias la="ls -a -l -G -h -D \"\""
alias lst="/bin/ls -G -l -h"
alias llt="/bin/ls -G -a -l -h"

########################################################
alias gw="gcc -Wall -Wextra -Werror"
alias gg="clang -fsanitize=address -fsanitize=undefined -Wall -Wextra -Werror -g -O0"

########################################################
alias gst="git status"

########################################################
# Source alias file
if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi

########################################################
# History file for zsh
HISTFILE=~/.zsh_history

# How many commands to store in history
HISTSIZE=99
SAVEHIST=99

########################################################
alias francinette=/Users/aurelienfocant/francinette/tester.sh
alias paco=/Users/aurelienfocant/francinette/tester.sh

########################################################
export BBR=born2beroot.duckdns.org
########################################################
export PATH=$PATH:/Users/aurelienfocant/my_scripts
alias gut=git_update.sh
