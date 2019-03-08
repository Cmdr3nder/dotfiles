--load standard vis module, providing parts of the Lua API
require('vis')
require('themes/gruvbox_dark_hard_transparent')

vis.events.subscribe(vis.events.INIT, function()
    vis:command('set theme gruvbox_dark_hard_transparent')

    -- Deal with Programmer Dvorak
    vis:map(vis.modes.NORMAL, "h", "h")
    vis:map(vis.modes.NORMAL, "t", "j")
    vis:map(vis.modes.NORMAL, "n", "k")
    vis:map(vis.modes.NORMAL, "s", "l")

    vis:map(vis.modes.VISUAL, "h", "h")
    vis:map(vis.modes.VISUAL, "t", "j")
    vis:map(vis.modes.VISUAL, "n", "k")
    vis:map(vis.modes.VISUAL, "s", "l")

    -- Quick access to beginning and end of line
    vis:map(vis.modes.NORMAL, "-", "$")
    vis:map(vis.modes.NORMAL, "_", "^")

    vis:map(vis.modes.VISUAL, "-", "$")
    vis:map(vis.modes.VISUAL, "_", "^")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    -- Your per window configuration options e.g.
    vis:command('set number on')
    vis:command('set tabwidth 4')
    vis:command('set expandtab on')
    vis:command('set autoindent on')
end)

