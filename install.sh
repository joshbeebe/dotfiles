#!/bin/bash

links=".bashrc .vimrc .xinitrc .Xresources"

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

echo "Copying icons"
cp -r /usr/share/awesome/icons ~/.config/awesome/
echo "Copying taglist"
cp -r /usr/share/awesome/themes/default/taglist ~/.config/awesome/themes/default/

echo "Done."

