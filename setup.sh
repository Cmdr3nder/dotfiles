#!/bin/sh

echo "setting up dot files"

# Deal with i3
echo "----------------------i3----------------------"
echo "prepare directories"
mkdir -pv ~/.config/i3
echo "soft-link i3 config"
ln -si $PWD/i3/config ~/.config/i3/config
echo "soft-link i3block config"
ln -si $PWD/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
