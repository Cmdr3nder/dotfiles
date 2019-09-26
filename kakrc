colorscheme solarized-light
add-highlighter global/number-lines number-lines

source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "andreyorst/fzf.kak"
plug "andreyorst/smarttab.kak"

hook global ModuleLoaded fzf %{
    set global fzf_implementation sk
    set global fzf_file_command "rg --files --hidden -g'!.git'"
    set global fzf_sk_grep_command 'rg -LHn'
    set global fzf_preview false
}

hook global WinCreate ^[^*]+$ %{editorconfig-load}

hook global BufNewFile / %{
    set-option -add buffer path %sh{dirname "$kak_buffile"}
}

hook global BufCreate  / %{
    set-option -add buffer path %sh{dirname "$kak_buffile"}
}

map global normal <c-p> ': fzf-mode<ret>'

set-option global ui_options ncurses_assistant=none
