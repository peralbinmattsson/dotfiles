# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR=vim

# thanks mitsuhiko
KO_DEFAULT_COLOR="[00m"
KO_GRAY_COLOR="[37m"
KO_PINK_COLOR="[35m"
KO_GREEN_COLOR="[32m"
KO_ORANGE_COLOR="[33m"
KO_RED_COLOR="[31m"
if [ `id -u` == '0' ]; then
    KO_USER_COLOR=$KO_RED_COLOR
else
    KO_USER_COLOR=$KO_PINK_COLOR
fi

KO_VC_PROMPT=$'on \033[34m%n\033[00m:\033[00m%b\033[32m%m%u'

ko_vcprompt() {
    vcprompt -f "$KO_VC_PROMPT"
}

if [ -f ~/bin/vcprompt ]; then
PS1='\n\e${KO_USER_COLOR}\u \e${KO_GRAY_COLOR}at \
\e${KO_ORANGE_COLOR}\h \e${KO_GRAY_COLOR}in \
\e${KO_GREEN_COLOR}\w \e${KO_GRAY_COLOR}`ko_vcprompt` \e${KO_DEFAULT_COLOR}
> '
else
PS1='\n\e${KO_USER_COLOR}\u \e${KO_GRAY_COLOR}at \
\e${KO_ORANGE_COLOR}\h \e${KO_GRAY_COLOR}in \
\e${KO_GREEN_COLOR}\w \e${KO_GRAY_COLOR} \e${KO_DEFAULT_COLOR}
> '
fi

# TMUX
alias tmux="TERM=screen-256color tmux"

alias sysupd="sudo apt-get update && sudo apt-get upgrade"

alias grw="grunt watch"
alias venv=". venv/bin/activate"

# The rest is from a stock ubuntu .bashrc -->
#
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.local/bin/bashmarks.sh ]; then
    source ~/.local/bin/bashmarks.sh
fi
