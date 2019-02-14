" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'lotabout/skim'
Plug 'lotabout/skim.vim'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'racer-rust/vim-racer' "cargo install racer
call plug#end()

" deoplete config - autocompletion
let g:deoplete#enable_at_startup = 1

" skim config
let g:skim_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-h': 'split',
            \ 'ctrl-v': 'vsplit',
            \}
" down/up/left/right
let g:skim_layout = { 'down': '~20%' }
let g:skim_colors = {
            \ 'fg': ['fg', 'GruvboxGray'],
            \ 'bg': ['bg', 'Normal'],
            \ 'h1': ['fg', 'GruvboxRed'],
            \ 'fg+': ['fg', 'GruvboxGreen'],
            \ 'bg+': ['bg', 'GruvboxBg1'],
            \ 'h1+': ['fg', 'GruvboxRed'],
            \ 'info': ['fg', 'GruvboxOrange'],
            \ 'prompt': ['fg', 'GruvboxBlue'],
            \ 'header': ['fg', 'GruvboxBlue'],
            \ 'pointer': ['fg', 'Error'],
            \ 'marker': ['fg', 'Error'],
            \ 'spinner': ['fg', 'Statement'],
            \ }

" line config
function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

set noshowmode
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \  'left': [
            \           [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified' ]
            \  ],
            \  'right': [
            \            [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ]
            \  ]
            \ },
            \ 'component_function': {
            \  'gitbranch': 'gitbranch#name',
            \  'fileformat': 'LightlineFileformat',
            \  'filetype': 'LightlineFiletype',
            \ }
            \}

" programmer dvorak remap
noremap h h
noremap t j
noremap n k
noremap s l
noremap l n
noremap L N
nnoremap <C-h> <C-W><C-h>
nnoremap <C-t> <C-W><C-j>
nnoremap <C-n> <C-W><C-k>
nnoremap <C-s> <C-W><C-l>
nnoremap <C-W><C-h> <C-W><C-h>
nnoremap <C-W><C-t> <C-W><C-j>
nnoremap <C-W><C-n> <C-W><C-k>
nnoremap <C-W><C-s> <C-W><C-l>

" easy access to beginning and end of line
noremap - $
noremap _ ^

" colors
set background=dark
" colorscheme elflord
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" turn on line numbers
set number

" turn off wrapping
set nowrap

" configure wrapping
set linebreak

" set tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" set up list/listchars (:list, :nolist, :list!)
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
