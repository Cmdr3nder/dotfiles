#!/bin/sh

if [ -z "$(setxkbmap -query | grep 'dvp')" ]; then
    setxkbmap -layout us -variant dvp
    echo "switched to dvorak"
else
    setxkbmap -layout us
    echo "switched to qwerty"
fi
