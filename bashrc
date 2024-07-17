#----------------------------------------------------------------------------------------#
if uname -a | awk '{print $NF}' | grep --silent arm; then
	alias ls="ls -l -h -G -D \"\"" 
	alias ll="ls -a -l -G -h -D \"\""
	alias la="ls -a -l -G -h -D \"\""
	alias lst="/bin/ls -G -l -h"
	alias llt="/bin/ls -G -a -l -h"
elif uname -a | awk '{print $1}' | grep --silent Linux; then
	alias ls="ls -l -h -G -v --color=auto"
	alias lh="ls -l -h -G -a -v --color=auto"
	alias la="ls -l -h -G -a -v --color=auto"
	alias lst="/bin/ls -lh -v --color=auto"
	alias lat="/bin/ls -lha -v --color=auto"
else
	alias ls="ls -l -h -G"
	alias lh="ls -l -h -G -a"
	alias la="ls -l -h -G -a"
	alias lst="/bin/ls -lhG -T"
	alias lat="/bin/ls -lhaG -T"
fi

alias gw="gcc -Wall -Wextra -Werror"
alias gg="clang -fsanitize=address -fsanitize=undefined -Wall -Wextra -Werror -g -O0"

alias gut=git_update.sh
alias gst="git status"

alias francinette=$HOME/francinette/tester.sh
alias paco=$HOME/francinette/tester.sh

alias python=python3
alias pip=pip3

if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi
#----------------------------------------------------------------------------------------#

#----------------------------------------------------------------------------------------#
USER=afocant
MAIL=afocant@student.s19.be
export USER MAIL
#----------------------------------------------------------------------------------------#
export BBR=born2beroot.duckdns.org
alias bbr="ssh aurel@$BBR -X -p 4242"
export PATH=$PATH:$HOME/my_scripts
#----------------------------------------------------------------------------------------#

#----------------------------------------------------------------------------------------#
HISTFILE=~/.zsh_history
HISTSIZE=99
SAVEHIST=99
#----------------------------------------------------------------------------------------#
