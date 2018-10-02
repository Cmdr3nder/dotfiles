#!/bin/sh

echo "setting up dot files"
DIR_SH=`dirname "$(readlink -f "$0")"`
echo $DIR_SH

# Deal with i3
echo "----------------------i3----------------------"
echo "prepare directories"
mkdir -pv ~/.config/i3
echo "soft-link i3 config"
ln -si $DIR_SH/i3/config ~/.config/i3/config
echo "clone i3blocks-contrib"
mkdir -pv ~/.config/i3blocks
ls ~/.config/i3blocks/contrib 1>/dev/null 2>/dev/null || git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks/contrib
echo "soft-link i3block config"
ln -si $DIR_SH/i3/i3blocks.conf ~/.config/i3blocks/config
