#!/bin/sh

echo "setting up dot files"

# Deal with i3
echo "----------------------i3----------------------"
echo "prepare directories"
mkdir -pv ~/.config/i3
echo "soft-link config"
ln -si $PWD/i3/config ~/.config/i3/config

