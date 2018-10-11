#!/bin/sh

if [ -z "$(ps aux | grep 'CHROME_NETFLIX' | grep -v 'grep')" ]; then
    google-chrome -app=https://netflix.com --class=CHROME_NETFLIX 2>/dev/null 1>/dev/null &
fi
