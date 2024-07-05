#----------------------------------------------------------------------------------------#
if uname -a | awk '{print $NF}' | grep arm; then
	alias ls="ls -l -h -G -D \"\"" 
	alias ll="ls -a -l -G -h -D \"\""
	alias la="ls -a -l -G -h -D \"\""
	alias lst="/bin/ls -G -l -h"
	alias llt="/bin/ls -G -a -l -h"
else
	alias ls="ls -l -h -G"
	alias lh="ls -l -h -G -a"
	alias la="ls -l -h -G -a"
	alias lst="/bin/ls -lh -T"
	alias lat="/bin/ls -lha -T"
fi

alias gw="gcc -Wall -Wextra -Werror"
alias gg="clang -fsanitize=address -fsanitize=undefined -Wall -Wextra -Werror -g -O0"

alias gut=git_update.sh
alias gst="git status"

alias francinette=/Users/aurelienfocant/francinette/tester.sh
alias paco=/Users/aurelienfocant/francinette/tester.sh

alias python=python3
alias pip=pip3

if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi
#----------------------------------------------------------------------------------------#


#----------------------------------------------------------------------------------------#
HISTFILE=~/.zsh_history

# How many commands to store in history
HISTSIZE=99
SAVEHIST=99
#----------------------------------------------------------------------------------------#


#----------------------------------------------------------------------------------------#
export BBR=born2beroot.duckdns.org

export PATH=$PATH:/Users/aurelienfocant/my_scripts
#----------------------------------------------------------------------------------------#
