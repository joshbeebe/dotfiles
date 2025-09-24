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
    # Set XDG variables (maybe other things too?) for flatpak
    /etc/profile.d/flatpak.sh
    dbus-run-session Hyprland
    #/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
fi

PATH=$PATH:~/.bin:~/dotfiles/bin
