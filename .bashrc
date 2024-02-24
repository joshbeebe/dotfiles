#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='╔═[\e[1;33m\e[m\t]\u@\h[\w]\n╚» '

alias la='ls -a'

alias pup='sudo pacman -Syu'
alias psh='pacman -Ss'
alias pin='sudo pacman -S'
alias prm='sudo pacman -Rs'

alias fucking='sudo'
alias wifi='sudo wifi-menu wlo1'

alias amix='alsamixer'

alias x='startx'
alias n='xswitch n'

alias emacs="emacs -nw"

if [ -z "${WAYLAND_DISPLAY}" ] && [ $(tty) = "/dev/tty1" ]; then
    export XCURSOR_SIZE=24
    dbus-run-session Hyprland
fi

PATH=$PATH:~/.bin
