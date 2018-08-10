export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

# Base simple prompt
export PS1="[\[\e[31m\]\`nonzero_return\`\[\e[m\]] \[\e[36m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[36m\]\H\[\e[m\]\[\e[37m\]:\[\e[m\]\[\e[32m\]\W\[\e[m\] > "

export EDITOR='nvim'
alias vim='nvim'

# Bash completion and better prompt
[ -f /home/linuxbrew/.linuxbrew/etc/bash_completion ] && . /home/linuxbrew/.linuxbrew/etc/bash_completion
if [ -f "/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share"
    source "/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

alias ll='ls -alh'

alias vnc-tunnel-salinized='ssh -L 5901:localhost:5901 -N -f ssouder@web0.salinized.com'

