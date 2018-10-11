#!/bin/sh

if [ -z "$(ps aux | grep 'CHROME_CRUNCHYROLL' | grep -v 'grep')" ]; then
    google-chrome --app=https://crunchyroll.com --class=CHROME_CRUNCHYROLL 2>/dev/null 1>/dev/null &
fi
