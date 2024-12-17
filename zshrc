if uname -a | awk '{print $NF}' | grep --silent arm; then
	alias ls="ls -l -h -G -D \"\"" 
	alias ll="ls -a -l -G -h -D \"\""
	alias la="ls -a -l -G -h -D \"\""
	alias lst="/bin/ls -G -l -h -tr"
	alias lat="/bin/ls -G -l -h -tr -a"
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

#----------------------------------------------------------------------------------------#
alias src="source ~/.zshrc"
export PATH=$PATH:$HOME/my_scripts
export PATH=$PATH:$HOME/my_scripts/git_wrappers
export PATH=$PATH:$HOME/my_scripts/vim
export PATH=$PATH:$HOME/my_scripts/colors
#----------------------------------------------------------------------------------------#
alias tags=$HOME/my_scripts/get_ctags.sh
alias prot=$HOME/my_scripts/my_prototypes.sh
#----------------------------------------------------------------------------------------#
alias gil="git log --oneline --graph --color=always -n20"
alias gila="git log --oneline --graph --all --color=always -n20"
alias gut=$HOME/my_scripts/git_wrappers/git_update.sh
alias gst=$HOME/my_scripts/git_wrappers/git_status_colored.sh
#----------------------------------------------------------------------------------------#
alias vim="nvim"
alias svi=$HOME/my_scripts/vim/vim_session.sh
#----------------------------------------------------------------------------------------#
alias pd="pushd"
alias dv="dirs -v"
pdv () {
	pushd -q $@
	dirs -v
}
#----------------------------------------------------------------------------------------#

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
alias xsel="xsel --clipboard"
#----------------------------------------------------------------------------------------#

#----------------------------------------------------------------------------------------#
if echo $0 | grep -qi zsh; then
	HISTFILE=$HOME/.zsh_history
	setopt append_history # append rather then overwrite
	setopt inc_append_history # add history immediately after typing a command
	setopt sharehistory

elif echo $0 | grep -qi bash; then
	HISTFILE=$HOME/.bash_history
	# When the shell exits, append to the history file instead of overwriting it
   shopt -s histappend
   # After each command, append to the history file and reread it
   export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

fi
HISTSIZE=99999999
SAVEHIST=99999999
#----------------------------------------------------------------------------------------#
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

if [ -f ~/.local/bin/oh-my-posh ]; then
	export PATH=$PATH:/home/aurel/.local/bin
	eval "$(oh-my-posh init zsh --config ~/.local/bin/stelbent-compact.minimal.omp.json)" 
fi

if uname | grep -qi Linux; then
	if echo $0 | grep zsh; then
		setopt PROMPT_SUBST
		PROMPT='%* %F{green}%n@%m%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
	fi
fi

[ "$(uname)" = "Linux" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
