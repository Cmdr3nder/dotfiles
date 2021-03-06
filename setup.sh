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

sudo_careful_link() {
    if [ -f $2 ]; then
        if [ ! -L $2 ]; then
            echo "sudo mv $2 $2.bup"
            sudo mv $2 $2.bup
        fi
    fi

    echo "sudo ln -sf $1 $2"
    sudo ln -sf $1 $2
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

# manual_install_warn $1=program $2=url
manual_install_warn() {
    if [ -z "$(which $1)" ]; then
        echo "Please install $1 from $2"
    fi
}

# Deal with bash
echo "---------------------bash---------------------"
careful_link $DIR_SH/.bashrc ~/.bashrc

# Deal with necessary programs
echo "------------------apt-install-----------------"
careful_install compton
careful_install dmenu suckless-tools
careful_install arandr
careful_install lxappearance
careful_install feh
careful_install pulseaudio
careful_install_font fonts-font-awesome
careful_install alsamixer alsa-utils
careful_install acpi
careful_install python3
careful_install mpv
careful_install cmus
careful_install i3status
careful_install i3blocks
careful_install i3lock
careful_install wget
careful_install unzip
careful_install paprefs
careful_install hsetroot
careful_install sshfs
careful_install editorconfig
execute_careful_install

echo "--------------manual-install------------------"
mkdir -pv ~/.bin
if [ -z "$(which youtube-dl)" ]; then
    wget https://youtube-dl.org/downloads/latest/youtube-dl
    echo "mv youtube-dl ~/.bin/youtube-dl"
    mv youtube-dl ~/.bin/youtube-dl
    echo "chmod +x ~/.bin/youtube-dl"
    chmod +x ~/.bin/youtube-dl
fi

mkdir -pv ~/.fonts
if [ -z "$(find ~/.fonts -type f -name "*San Francisco*")" ]; then
    wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
    echo "unzip master.zip"
    unzip master.zip
    SF_FONT=`find . -type d -name "*San*Francisco*"`
    echo "cp $SF_FONT/*.ttf ~/.fonts/"
    cp $SF_FONT/*.ttf ~/.fonts/
    echo "rm -rf $SF_FONT"
    rm -rf $SF_FONT
    echo "rm master.zip"
    rm master.zip
fi

manual_install_warn copyq https://github.com/hluk/CopyQ/releases
manual_install_warn playerctl https://github.com/acrisci/playerctl/releases
manual_install_warn kak "https://github.com/mawww/kakoune#22-installing"

# Deal with i3
echo "----------------------i3----------------------"
mkdir -pv ~/.bin
careful_link $DIR_SH/netflix.sh ~/.bin/netflix
careful_link $DIR_SH/youtube.sh ~/.bin/yy
careful_link $DIR_SH/keyboard.sh ~/.bin/skl
careful_link $DIR_SH/normalizexrandr.lua ~/.bin/normalizexrandr
mkdir -pv ~/.config/i3
careful_link $DIR_SH/i3/config ~/.config/i3/config
mkdir -pv ~/.config/i3blocks
careful_git_clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks/contrib
careful_link $DIR_SH/i3/i3blocks.conf ~/.config/i3blocks/config

# Deal with tools
echo "--------------------tools---------------------"
careful_link $DIR_SH/copy.sh ~/.bin/copy
careful_link $DIR_SH/copy.sh ~/.bin/clipboard
careful_link $DIR_SH/duh.sh ~/.bin/duh
careful_link $DIR_SH/mpvb.sh ~/.bin/mpvb
careful_link $DIR_SH/get-edid.py ~/.bin/get-edid
careful_link $DIR_SH/get-external-edid.sh ~/.bin/get-external-edid

# Deal with git
echo "---------------------git----------------------"
sudo_careful_link $DIR_SH/gitconfig_system /etc/gitconfig

# Deal with kakoune
echo "---------------------kak----------------------"
mkdir -pv ~/.config/kak
careful_git_clone https://github.com/andreyorst/plug.kak.git ~/.config/kak/plugins/plug.kak
careful_link $DIR_SH/kakrc ~/.config/kak/kakrc

# Manually config gtk
careful_link $DIR_SH/gtk.css ~/.config/gtk-3.0/gtk.css
