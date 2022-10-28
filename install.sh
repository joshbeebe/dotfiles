#!/bin/bash

links=".bashrc .vimrc .xinitrc .Xresources .zshrc"

for i in $links; do
	echo "Linking $i"
	rm ~/$i
	ln -s $PWD/$i ~/$i
done

echo "Linking awesome"
rm ~/.config/awesome/rc.lua

mkdir -p ~/.config/awesome/themes/default/taglist
mkdir -p ~/.config/awesome/icons

ln -s $PWD/awesome/rc.lua ~/.config/awesome/rc.lua

echo "Linking awesome theme"
rm ~/.config/awesome/themes/default/theme.lua
ln -s $PWD/awesome/theme.lua ~/.config/awesome/themes/default/theme.lua

echo "Linking kitty config"
rm ~/.config/kitty/kitty.conf
rm ~/.config/kitty/current-theme.conf
ln -s $PWD/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $PWD/kitty/current-theme.conf ~/.config/kitty/current-theme.conf

echo "Copying icons"
cp -r /usr/share/awesome/icons ~/.config/awesome/
echo "Copying taglist"
cp -r /usr/share/awesome/themes/default/taglist ~/.config/awesome/themes/default/

echo "Done."

