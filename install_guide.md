# Debian/Ubuntu/Linux Mint

## i3
1) Install appropriate matching version from the repositories documented at https://i3wm.org/docs/repositories.html
    * If Ubuntu, use the name of your release such as "xenial" as DISTRIB_CODENAME.
    * If Mint, use the matching ubuntu name for your release such as "xenial" instead of "serena"
1) Install suckless-tools [dmenu], arandr, lxappearance, feh, pulseaudio, fonts-font-awesome, alsa-utils, acpi, python3, youtube-dl, mpv, i3status, i3blocks, and i3lock from apt if not already installed
1) Install copyq (for clipboard manangement), is not available from apt
1) Install playerctl from https://github.com/acrisci/playerctl/releases
1) Install font-awesome from https://github.com/FortAwesome/Font-Awesome/releases
    * unzip font-awesome-web.zip
    * cd Font-Awesome
    * mkdir ~/.fonts
    * cp *.ttf ~/.fonts/
    * Use cheatsheet @ https://fontawesome.com/v4.7.0/cheatsheet/ to add more icons if you wish
1) Install San-Francisco, or another font; https://github.com/supermarin/YosemiteSanFranciscoFont
    * unzip SanFrancisco.zip
    * cd SanFrancisco
    * mkdir ~/.fonts
    * cp *.ttf ~/.fonts/
1) Use lxappearance to pick theme for GTK, and set the GTK font
    * Nemo is the File Manager; use one as an example of the GTK theme working
    * Font "SFNS Display"
    * Theme "Linux-Mint-Y-Darker"
1) Run setup.sh
1) Log out and back in
