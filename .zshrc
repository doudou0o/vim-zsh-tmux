# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
  git
  wd
  autojump
  #zsh-autosuggestions
  #zsh-syntax-highlighting
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM='xterm-256color'

#ZSH_THEME="gentoo"
ZSH_THEME="mythemeNormal"
#ZSH_THEME="mytheme2Line"
#ZSH_THEME="mythemeGreat"
#ZSH_THEME="mytheme"
#ZSH_THEME="blog"
ZSH_THEME="powerlevel10k/powerlevel10k"

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

#Rebind HOME and END to do the decent thing:
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
case $TERM in (xterm*)
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line
esac

#autoload -U compinit promptinit
#compinit
#promptinit
##PROMPT='[%n@%m]%~%# '


# User specific aliases and functions
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

alias cls='clear'
# alias ll='ls -l'
# alias la='ls -a'
alias ll='colorls --dark -lA --sd --gs --group-directories-first'
alias ls='colorls --dark --group-directories-first'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='vi'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=mate   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=mate     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'


# Tmux
#LIBEVENT_PATH=/data/chenchen/opt/libevent2
#export LD_LIBRARY_PATH="$LIBEVENT_PATH/lib/:$LD_LIBRARY_PATH"
#alias tmux='/data/chenchen/opt/tmux2.1/bin/tmux'

# 禁止锁屏
stty -ixon

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Anaconda
#export PATH="/Users/cchen/opt/anaconda2/bin:$PATH"
export PATH="/Users/cchen/opt/anaconda3/bin:$PATH"

# powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# FUNCs
function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}
