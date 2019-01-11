" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

" programmer dvorak remap
noremap h h
noremap t j
noremap n k
noremap s l
noremap l n
noremap L N

" easy access to beginning and end of line
noremap - $
noremap _ ^

" colors
set background=dark
" colorscheme elflord
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
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
