# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

## atomic console theme
if [[ "$TERM" = "linux" ]]; then                                                                                                                                                                                     
    echo -en "\e]P0141A1F"
    echo -en "\e]P1EC5252"
    echo -en "\e]P25DA813"
    echo -en "\e]P3C97016"
    echo -en "\e]P43790E9"
    echo -en "\e]P5A35AED"
    echo -en "\e]P613AEAE"
    echo -en "\e]P7A6B5C5"
    echo -en "\e]P8202931"
    echo -en "\e]P9FF9191"
    echo -en "\e]PA9ACD68"
    echo -en "\e]PBEDA45C"
    echo -en "\e]PC7DBEFF"
    echo -en "\e]PDCA96FF"
    echo -en "\e]PE6ECFCF"
    echo -en "\e]PF53697F"
    #clear #for background artifacting
fi

## atomic console theme
if [[ "$TERM" = "linux" ]]; then
    echo -en "\e]P0141A1F"
    echo -en "\e]P1EC5252"
    echo -en "\e]P25DA813"
    echo -en "\e]P3C97016"
    echo -en "\e]P43790E9"
    echo -en "\e]P5A35AED"
    echo -en "\e]P613AEAE"
    echo -en "\e]P7A6B5C5"
    echo -en "\e]P8202931"
    echo -en "\e]P9FF9191"
    echo -en "\e]PA9ACD68"
    echo -en "\e]PBEDA45C"
    echo -en "\e]PC7DBEFF"
    echo -en "\e]PDCA96FF"
    echo -en "\e]PE6ECFCF"
    echo -en "\e]PF53697F"
    #clear #for background artifacting
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:$PATH"
fi

# libvirt
export LIBVIRT_DEFAULT_URI=qemu:///system

# tor settings
export TOR_SOCKS_HOST=10.8.0.1
export TOR_SOCKS_PORT=9050
export TOR_CONTROL_HOST=10.8.0.1
export TOR_CONTROL_PORT=9051
export TOR_SKIP_LAUNCH=1
export TOR_CONTROL_PASSWD='"16:B50E7A71C45B5C7660583EB5DFDD4722A791309148E119636A48C0C38C"'

# disable bell for system terminal
if [[ "$TERM" = "linux" ]]; then
    setterm -blength 0
fi

if [[ "$TERM" = "linux" ]]; then
	if [[ "$(tty)" = "/dev/tty1" ]]; then
		startx >& /dev/null
	fi
fi
