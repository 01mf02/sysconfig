" Pathogen plugin manager from https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Show name of currently edited file in terminal window name
set title

" Fix xfce4-terminal issue as in: https://github.com/neovim/neovim/issues/5990
set guicursor=

" Talking about xfce4-terminal:
" To disable pasting with CTRL-SHIFT-v, check
" Xfce -> Appearance -> Settings -> Enable editable accelerators.
" Then, in xfce4-terminal, hover over Edit -> Paste and
" press DEL to remove the shortcut.
"
" Furthermore, set Solarized as color theme in
" Edit -> Preferences -> Colors -> Presets.

" Disable folding
set nofoldenable

" vim-pandoc from https://github.com/vim-pandoc/vim-pandoc
" To enable omnicompletion (e.g. for literature), make sure that
" Python 3 support is enabled. Run :CheckHealth to see whether it works.
let g:pandoc#modules#disabled = ["folding"]

" Use Solarized theme from https://github.com/altercation/vim-colors-solarized
set background=dark
colorscheme solarized

" Powerline fonts for vim-airline at https://github.com/vim-airline/vim-airline
" Install via: sudo apt-get install fonts-powerline
let g:airline_powerline_fonts = 1
