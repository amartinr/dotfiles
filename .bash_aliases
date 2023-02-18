alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias df='df -x none -x devpts -x devtmpfs -x rootfs'
#alias df='df -x tmpfs -x none -x devpts -x devtmpfs -x rootfs'
alias man='LANG=C man'
alias ping='ping -n -c 5'
alias ping6='ping6 -n -c 5'
alias feh='feh -Z'

alias sudo='sudo '

#alias systemctl='systemctl --no-pager'
#alias journalctl='journalctl --no-pager'

alias scrot-select='scrot -s'
alias scrot-window='scrot -u'

alias telegram='flatpak run org.telegram.desktop'
#alias firefox='flatpak run --filesystem=home org.mozilla.firefox -P default-release'
