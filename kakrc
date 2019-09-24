colorscheme solarized-light

source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "andreyorst/fzf.kak"

hook global ModuleLoaded fzf %{
    set global fzf_implementation sk
    set global fzf_file_command "rg --files --hidden -g'!.git'"
    set global fzf_sk_grep_command 'rg -LHn'
}

map global normal <c-p> ': fzf-mode<ret>'
