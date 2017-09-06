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

## less colors
LESS="-R"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
