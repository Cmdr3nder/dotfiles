# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# start gnome-keyring ssh-agent
# as seen https://wiki.archlinux.org/index.php/GNOME/Keyring#Using_the_keyring_outside_GNOME
# only needed for i3 right now
if [ "i3" = "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
export HISTCONTROL=erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# color prompt for tmux
if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
	color_prompt=yes
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W$(__git_ps1 " (%s)") \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[01;36m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w$(__git_ps1 " (%s)") \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='exa -alF --git'
alias lm='exa -lF --git'
alias la='exa -a'
alias l='exa -F'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

alias copy='xclip -sel clip'
alias clipboard=copy
alias fempty='sudo truncate -s 0'
alias tmux='tmux -2'
alias xargs='xargs '
alias shrink='tar cjf'
alias grow='tar xjf'

export EDITOR=vim

function cengageOn {
	pass Cengage/corp/abowers | sudo openconnect contractor.cengage.net -u abowers --no-cert-check --passwd-on-stdin --disable-ipv6
}

function fix_keyboard {
        setxkbmap -option caps:escape -option keypad:atm
}

function listppa {
    apt-cache policy $(dpkg --get-selections | grep -v deinstall$ | awk '{ print $1 }') | perl -e '@a = <>; $a=join("", @a); $a =~ s/\n(\S)/\n\n$1/g;  @packages = split("\n\n", $a); foreach $p (@packages) {print "$1: $2\n" if $p =~ /^(.*?):.*?500 http:\/\/ppa\.launchpad\.net\/(.*?)\s/s}'
}

function firefox-testing {
    mkdir ~/.tmp-ff-profile; /usr/bin/firefox -profile ~/.tmp-ff-profile; rm -rf ~/.tmp-ff-profile
}

function firefox-testing-dev {
    mkdir ~/.tmp-ff-dev-profile; /usr/local/bin/firefox_dev/firefox -profile ~/.tmp-ff-dev-profile; rm -rf ~/.tmp-ff-dev-profile
}

function current-cas {
    CURRENT_DIR=`pwd` && cd ~/projects/mindtap/cas && echo "cas" `git current` && cd ~/projects/mindtap/cas-canonical && echo "cas-canonical" `git current` && cd ~/projects/mindtap/cas-pipeline && echo "cas-pipeline" `git current` && cd ~/projects/mindtap/cas-canonical-pipeline && echo "cas-canonical-pipeline" `git current` && cd $CURRENT_DIR
}

function current-links {
    find ~/projects/mindtap -type d -name "node_modules" 2>/dev/null | xargs -I{} find {} -type l -maxdepth 1 | xargs ls -l
}

function npm_install_office {
    npm install "$@" --registry http://192.168.1.62:8081/repository/npm.group/;
}

function find_ip {
    inner_find_ip; echo $MY_IP
}

function inner_find_ip {
    if [ -n "$(ip -o -4 addr list | grep 'vpn0')" ]; then
        export MY_IP=`ip -o -4 addr list vpn0 | awk '{print $4}' | cut -d/ -f1`;
    elif [ -n "$(ip -o -4 addr list | grep 'tun0')" ]; then
        export MY_IP=`ip -o -4 addr list tun0 | awk '{print $4}' | cut -d/ -f1`;
    else
        export MY_IP="unknown"
    fi
}

function port_squatter {
    netstat -tulpn | grep $@
}

inner_find_ip

export PATH="$HOME/.cargo/bin:$PATH"
export CI=true

export PATH="/home/andrew/projects/learning/unique_dirs/target/debug:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOROOT=/usr/local/bin/go
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin

tabs 4

super_pass() {
    copyq disable
    /usr/bin/pass "$@"
    copyq enable
}

alias pass='super_pass'

export SKIM_DEFAULT_COMMAND="rg --files || git ls-tree -r --name-only HEAD || find ."

function skv() {
    FOUND=`sk` && echo $FOUND && vim $FOUND
}

function xmlless() {
    xmllint $1 --format | less
}

alias celar='clear'
alias rg='rg --color=always --heading'
alias less='less -R'
alias view='nvim -R'
