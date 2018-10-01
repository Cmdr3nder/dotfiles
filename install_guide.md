# Debian/Ubuntu/Linux Mint

## i3
1) Install appropriate matching version from the repositories documented at https://i3wm.org/docs/repositories.html
    * If Ubuntu, use the name of your release such as "xenial" as DISTRIB_CODENAME.
    * If Mint, use the matching ubuntu name for your release such as "xenial" instead of "serena"
1) Install suckless-tools [dmenu], arandr, lxappearance, feh, i3status, i3blocks, and i3lock from apt if not already installed
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
1) Use lxappearance to generate gtk configuration
    * If you still want to use San-Francisco you will need to edit the following
    * ~/.gtkrc-2.0 and ~/.config/gtk-3.0/settings.ini
1) Pick theme for GTK
    * Nemo is the File Manager; use one as an example of the GTK theme working
1) TODO: Set up i3blocks instead of i3status as seen on 'i3wm: Howto "Rice" your Desktop'.
1) Run setup.sh
