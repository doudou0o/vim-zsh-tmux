# .bashrc

#exec $HOME/opt/zsh/bin/zsh -l

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then                                                      
    export TERM='xterm-256color'
else
    export TERM-'xterm-color'
fi

# User specific aliases and functions
alias vim='/data/chenchen/vvim/bin/vim'
alias gearadmin='/opt/app/gearmand/bin/gearadmin'

# Tmux
LIBEVENT_PATH=/data/chenchen/opt/libevent2
export LD_LIBRARY_PATH="$LIBEVENT_PATH/lib/:$LD_LIBRARY_PATH"
alias tmux='/data/chenchen/opt/tmux2.1/bin/tmux'

# 禁止锁屏
stty -ixon
