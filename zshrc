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

# ssh-agent should start and add keys every time a shell is launched
ssh_keys=("github" "vogsphere" "debian_vm")

# on macOS M2 MBA, ssh-agent loads automatically when ssh-add is called
# it should loads the ssh keys with their passphrases stored in Keychain Access
# but only if they keys have been added once with
# ssh-add --apple-use-keychain <key>
if uname -a | grep --quiet -E "Darwin.*arm64"; then
	for k in ${ssh_keys[@]}; do
		key="${HOME}/.ssh/${k}"
		ssh-add -T ${key} &>/dev/null || ssh-add ${key} --apple-load-keychain
	done
fi

# on Linux you have to start a ssh-agent
if uname -a | grep --quiet -E "Linux"; then
	agent_file="${HOME}/.ssh/ssh-agent.env"
	if ! ps aux | grep -v grep | grep --quiet ssh-agent; then
		eval $(ssh-agent) &>/dev/null
		echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"  >${agent_file}
		echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >>${agent_file}
	else
		[ -f ${agent_file} ] && source ${agent_file}
	fi

	for k in ${ssh_keys[@]}; do
		key="${HOME}/.ssh/${k}"
		ssh-add -T ${key} &>/dev/null || ssh-add ${key} 2>/dev/null
	done
fi

# print exit message when exiting shell
trap "echo exited shell lvl $SHLVL" EXIT

# deprecated bash on macOS warning is annoying
export BASH_SILENCE_DEPRECATION_WARNING=1
# use homebrew bash
[ -f /opt/homebrew/bin/bash ] && alias bash="/opt/homebrew/bin/bash"
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

# HomeBrew for Ubuntu computers at 19,
# with brew manually installed in ~ directory
if [ -f ${HOME}/homebrew/bin/brew ]; then
	eval "$(${HOME}/homebrew/bin/brew shellenv)"
fi

# -- add JAVA tt PATH
export PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"

# source fzf
[[ $0 =~ zsh ]] && [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#-----------------------#
# GIT autocompletion
[[ $0 =~ zsh ]] && autoload -Uz compinit && compinit

if [[ $0 =~ bash ]]; then
	git_compl="$HOME/dotfiles/git-completion/git-completion.bash"
	[ -f $git_compl ] && source $git_compl
fi
