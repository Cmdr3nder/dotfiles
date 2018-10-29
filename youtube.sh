#!/bin/sh

if [ -z "$(ps aux | grep 'mpv' | grep 'youtube' | grep -v 'grep')" ]; then
    printf "%s\n" $@ | mpv --title="YouTube - mpv" --really-quiet --volume=100 --autofit=30% --geometry=-10-15 --ytdl --ytdl-format='mp4[height<=?720]' -ytdl-raw-options=playlist-start=1 --playlist=- 2>/dev/null 1>/dev/null &
fi
