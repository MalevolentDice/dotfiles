HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s histappend

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias sudo='sudo ' # make aliases available in sudo
alias ..='cd .. && pwd && ls'
alias pbcopy='xclip -selection clipboard'
alias vi='vim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export TERM=xterm-256color
export EDITOR=/usr/bin/vim
export PATH=${PATH}:~/bin:~/.local/bin:~/etc/scripts
export PATH=${PATH}:/usr/local/go/bin
export GOPATH=~

# Change up a variable number of directories
# E.g:
#   cu   -> cd ../
#   cu 2 -> cd ../../
#   cu 3 -> cd ../../../
function cu {
    local count=$1
    [ -z "${count}" ] && count=1
    
    local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path && pwd && ls
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Local settings go last
[ -f ~/.localrc ] && source ~/.localrc

# Mono for godot in VS code
export FrameworkPathOverride=/lib/mono/4.5
