#!/bin/bash
# suspend message display
killall -e -u "$USER" -USR1 dunst

# lock the screen
i3lock-fancy -p -f DejaVu-Sans

# resume message display
killall -e -u "$USER" -USR2 dunst
