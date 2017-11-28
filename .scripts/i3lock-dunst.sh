#!/bin/bash
# suspend message display
pkill -u "$USER" -USR1 dunst

# lock the screen
i3lock-fancy -p -f Sans

# resume message display
pkill -u "$USER" -USR2 dunst
