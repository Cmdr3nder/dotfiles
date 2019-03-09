# Debian/Ubuntu/Linux Mint

## i3
1) Install i3-gaps following instructions found https://github.com/Airblader/i3/wiki/Compiling-&-Installing
2) Run ./setup.sh
3) Use lxappearance to pick theme for GTK, and set the GTK font
    * Nemo is the File Manager; use one as an example of the GTK theme working
    * Font "SFNS Display"
    * Theme "Linux-Mint-Y-Darker"
4) Create 3 image softlinks in ~/Pictures for yourself [wallpaper, logpaper, lockpaper]
    * Update "System Settings > Login Window" to point to ~/Pictures/logpaper and disable "Draw user backgrounds"
    * Our i3lock config and feh/background img config will handle the rest
5) Run `sudo paprefs`
    * Network Server > Enable network access to local sound devices [check]
    * Don't require authentication [check]
6) Restart your computer `sudo reboot now`

## vis
1) Install pre-reqs `sudo apt install libtool-bin libncurses5-dev lua5.2 liblua5.2-dev lua-lpeg lua-lpeg-dev`
2) Get latest release of libtermkey from http://www.leonerd.org.uk/code/libtermkey/ (0.21.1)
3) Extract release with `tar -xvzf libtermkey-0.21.1.tar.gz`
4) `cd libtermkey-0.21.1`
5) `make && sudo make install`
7) Clone latest from https://github.com/martanne/vis
8) `./configure --enable-curses --enable-lua --enable-lpeg-static --enable-help`
9) `make && sudo make install`
