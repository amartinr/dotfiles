#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

## VTE
if [ -f /etc/profile.d/vte.sh ]; then
    . /etc/profile.d/vte.sh
fi

## powerline
if [ -f ~/.shell_prompt.sh ]; then
    . ~/.shell_prompt.sh
fi

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

if [ -f ~/.LESS_TERMCAP ]; then
    . ~/.LESS_TERMCAP
fi
