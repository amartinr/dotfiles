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

# set PATH so it includes user's private local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/share/gem/ruby/3.1.0/bin" ] ; then
    PATH="$HOME/.local/share/gem/ruby/3.1.0/bin:$PATH"
fi

PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"

# libvirt
export LIBVIRT_DEFAULT_URI=qemu:///system

# EDITOR used by i3-sensible-editor and other programs
export EDITOR=/usr/bin/vim

# move go build path
export GOPATH=~/.cache/go

export SYSTEMD_LESS='-RinQ'

# ansible
export ANSIBLE_CONFIG=$HOME/.config/ansible/ansible.cfg

# launch X if on first tty
#if [[ "$TERM" = "linux" ]]; then
#    if [[ "$(tty)" = "/dev/tty1" ]]; then
#        exec startx /etc/X11/Xsession > /dev/null 2>&1
#    fi
#fi
