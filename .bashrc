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
alias grep='grep --color=auto'

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

# Local settings go last
[ -f ~/.localrc ] && source ~/.localrc

