#!/bin/bash

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

ci_i=0
declare -a ci_l
# careful_install $1=cli-tool $2(opt)=package-if-different
careful_install() {
    if [ -z "$(which $1)" ]; then
        if [ -z "$2" ]; then
            ci_l[$ci_i]="$1"
        else
            ci_l[$ci_i]="$2"
        fi
        ci_i=$((ci_i + 1))
    fi
}

# careful_install_font $1=font-name $2(opt)=package-if-different
careful_install_font() {
    if [ -z "$(find / -type d -name "*$1*" 2>/dev/null)" ]; then
        if [ -z "$2" ]; then
            ci_l[$ci_i]="$1"
        else
            ci_l[$ci_i]="$2"
        fi
        ci_i=$((ci_i + 1))
    fi
}

# execute_careful_install
execute_careful_install() {
    if [ -n "${ci_l[*]}" ]; then
        echo "sudo apt install ${ci_l[*]}"
        sudo apt install ${ci_l[*]}
    fi
}

# Deal with bash
echo "---------------------bash---------------------"
careful_link $DIR_SH/.bashrc ~/.bashrc

# Deal with necessary programs
echo "------------------apt-install-----------------"
careful_install dmenu suckless-tools
careful_install arandr
careful_install lxappearance
careful_install feh
careful_install pulseaudio
careful_install_font fonts-font-awesome
careful_install alsamixer alsa-utils
careful_install acpi
careful_install python3
careful_install youtube-dl
careful_install mpv
careful_install i3status
careful_install i3blocks
careful_install i3lock
execute_careful_install

# Deal with i3
echo "----------------------i3----------------------"
mkdir -pv ~/.bin
careful_link $DIR_SH/vpn.sh ~/.bin/vpn
careful_link $DIR_SH/netflix.sh ~/.bin/netflix
careful_link $DIR_SH/youtube.sh ~/.bin/yy
mkdir -pv ~/.config/i3
careful_link $DIR_SH/i3/config ~/.config/i3/config
mkdir -pv ~/.config/i3blocks
careful_git_clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks/contrib
careful_link $DIR_SH/i3/i3blocks.conf ~/.config/i3blocks/config
