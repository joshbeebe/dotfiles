# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/josh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color=auto'
PS1="╔═[%D{%H:%M:%S} | %h] %n@%M [%d]"$'\n'"╚» "

alias la='ls -a'

alias pup='sudo pacman -Syu'
alias psh='pacman -Ss'
alias pin='sudo pacman -S'
alias prm='sudo pacman -Rs'

alias wifi='sudo wifi-menu wlo1'

alias amix='alsamixer'

alias x='startx'
