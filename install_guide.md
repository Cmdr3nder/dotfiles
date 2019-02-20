# Debian/Ubuntu/Linux Mint

## i3
1) Install i3-gaps following instructions found https://github.com/Airblader/i3/wiki/Compiling-&-Installing
1) Run ./setup.sh
1) Use lxappearance to pick theme for GTK, and set the GTK font
    * Nemo is the File Manager; use one as an example of the GTK theme working
    * Font "SFNS Display"
    * Theme "Linux-Mint-Y-Darker"
1) Create 3 image softlinks in ~/Pictures for yourself [wallpaper, logpaper, lockpaper]
    * Update "System Settings > Login Window" to point to ~/Pictures/logpaper and disable "Draw user backgrounds"
    * Our i3lock config and feh/background img config will handle the rest
1) Run `sudo paprefs`
    * Network Server > Enable network access to local sound devices [check]
    * Don't require authentication [check]
1) Restart your computer `sudo reboot now`
