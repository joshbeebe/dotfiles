#!/bin/bash

links=".bashrc .vimrc .xinitrc .Xresources .zshrc"

setup_dotfiles() {
	for i in $links; do
		echo "Linking $i"
		rm ~/$i
		ln -s $PWD/$i ~/$i
	done
}

setup_awesome() {
	echo "Linking awesome"
	rm ~/.config/awesome/rc.lua

	mkdir -p ~/.config/awesome/themes/default/taglist
	mkdir -p ~/.config/awesome/icons

	ln -s $PWD/awesome/rc.lua ~/.config/awesome/rc.lua

	echo "Linking awesome theme"
	rm ~/.config/awesome/themes/default/theme.lua
	ln -s $PWD/awesome/theme.lua ~/.config/awesome/themes/default/theme.lua

	echo "Copying icons"
	cp -r /usr/share/awesome/icons ~/.config/awesome/
	echo "Copying taglist"
	cp -r /usr/share/awesome/themes/default/taglist ~/.config/awesome/themes/default/
}

setup_kitty() {
	echo "Linking kitty config"
	rm ~/.config/kitty/kitty.conf
	rm ~/.config/kitty/current-theme.conf
	ln -s $PWD/kitty/kitty.conf ~/.config/kitty/kitty.conf
	ln -s $PWD/kitty/current-theme.conf ~/.config/kitty/current-theme.conf
}

setup_sway() {
	echo "Linking sway config"
	mkdir -p ~/.config/sway/
	rm ~/.config/sway/config
	ln -s $PWD/sway/config ~/.config/sway/config
}

setup_hyprland() {
	echo "Linking hyprland"
	mkdir -p ~/.config/hypr/
	rm ~/.config/hypr/hyprland.conf
	ln -s $PWD/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
}

setup_waybar() {
	echo "Linking waybar"
	mkdir -p ~/.config/waybar
	rm ~/.config/waybar/config
	ln -s $PWD/waybar/config ~/.config/waybar/config
}

setup_hyprland
setup_kitty
setup_waybar

echo "Done."

