# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export LESSHISTFILE=/dev/null
export LESSHISTSIZE=0
export HTOPRC=/dev/null

export MAILCHECK=60

# i3blocks variables
export AUDIO_HIGH_SYMBOL=''
export AUDIO_MED_SYMBOL=''
export AUDIO_LOW_SYMBOL=''
#export MUTED_COLOR=''
export LONG_FORMAT='${VOL}%'

if [ $(tty) == "/dev/tty1" ]; then
    startx >& /dev/null
    systemctl --user stop xsession.target
    #systemctl --user stop graphical-sesssion.target
fi

