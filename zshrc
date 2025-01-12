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
export BBR=born2beroot.duckdns.org
alias bbr="ssh -p 4242 aurel@$BBR -X"
alias xsel="xsel --clipboard"
#----------------------------------------------------------------------------------------#

# # export always the same ssh-agent per machine
# if system_profiler SPHardwareDataType | grep --quiet FC3PYG54P7 ; then	# M2 Macbook Air
# 	export SSH_AUTH_SOCK=/var/folders/_1/c_kbgn7x6lx78dy05x5nswt80000gn/T//ssh-v923bNl1UqWu/agent.28238
# 	export SSH_AGENT_PID=28239
# elif [[ $(hostname) =~ ".s19.be" ]]; then						# s19 iMac network
# 	export SSH_AUTH_SOCK=/tmp/ssh-XXXXXXWPfoL3/agent.12902
# 	export SSH_AGENT_PID=12903
# fi

# # export always the same ssh-agent per machine

#
# if [ -z "$SSH_AGENT_PID" ] && [ -f ~/.ssh/ssh-agent.env ] ; then
# 	source ~/.ssh/ssh-agent.env
# fi
#
# ssh_keys=("github" "vogsphere" "debian_vm")
# for key in ${ssh_keys[@]}; do
# 	if ! ssh-add -T "${HOME}/.ssh/${key}.pub" &>/dev/null; then
# 		ssh-add "${HOME}/.ssh/${key}"
# 	fi
# done
#
# 	cat >~/.ssh/ssh-agent.env <<EOF
# export SSH_AUTH_SOCK=$SSH_AUTH_SOCK
# export SSH_AGENT_PID=$SSH_AGENT_PID
# EOF

ssh_keys=("github" "vogsphere" "debian_vm")
# on macOS M2 MBA, ssh-agent loads automatically when ssh-add is called
# it should loads the ssh keys with their passphrases stored in Keychain Access
if uname -a | grep --quiet -E "Darwin.*arm64"; then
	for key in ${ssh_keys[@]}; do
		ssh-add "${HOME}/.ssh/${key}" --apple-load-keychain 2>/dev/null
	done
fi

# on Linux you have to start a ssh-agent
if uname -a | grep --quiet -E "Linux"; then
	agent_file="~/.ssh/ssh-agent.env"
	if ! ps aux | grep -v grep | grep ssh-agent; then
		eval $(ssh-agent)
		cat >${agent_file} <<EOF
export SSH_AUTH_SOCK=$SSH_AUTH_SOCK
export SSH_AGENT_PID=$SSH_AGENT_PID
EOF
	else
		[ -f ${agent_file} ] && source ${agent_file}
	fi
fi

# print exit message when exiting shell
[[ $0 == bash ]] && trap "echo 'Exiting bash'" EXIT
[[ $0 == zsh ]] && TRAPEXIT() { echo 'Exiting zsh' }
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

# if [[ "$(uname)" = "Linux" ]] && [[ ! $(uname -n) =~ "s19" ]] ; then


if [ -d /home/linuxbrew ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# -- add JAVA tt PATH
export PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"
