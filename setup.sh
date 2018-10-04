#!/bin/sh

DIR_SH=`dirname "$(readlink -f "$0")"`

# careful_link $1=source $2=link
careful_link() {
    if [ -f $2 ]; then
        if [ ! -L $2 ]; then
            echo "mv $2 $2.bup"
            mv $2 $2.bup
        fi
    fi

    echo "ln -sf $1 $2"
    ln -sf $1 $2
}

# careful_git_clone $1=repo $2=folder
careful_git_clone() {
    if [ ! -d $2 ]; then
        if [ -f $2 ]; then
            echo "mv $2 $2.bup"
            mv $2 $2.bup
        fi

        echo "git clone $1 $2"
        git clone $1 $2
    fi
}

# Deal with bash
echo "---------------------bash---------------------"
careful_link $DIR_SH/.bashrc ~/.bashrc

# Deal with i3
echo "----------------------i3----------------------"
mkdir -pv ~/.config/i3
careful_link $DIR_SH/i3/config ~/.config/i3/config
mkdir -pv ~/.config/i3blocks
careful_git_clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks/contrib
careful_link $DIR_SH/i3/i3blocks.conf ~/.config/i3blocks/config
