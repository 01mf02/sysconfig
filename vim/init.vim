" Pathogen plugin manager from https://github.com/tpope/vim-pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" Show name of currently edited file in terminal window name
set title

" Disable folding
set nofoldenable

" vim2hs from https://github.com/dag/vim2hs
let g:haskell_conceal_wide = 1
let g:haskell_conceal_bad = 1

" vim-pandoc from https://github.com/vim-pandoc/vim-pandoc
" To enable omnicompletion (e.g. for literature), make sure that
" Python 3 support is enabled. Run :CheckHealth to see whether it works.
let g:pandoc#modules#disabled = ["folding"]

" Use Solarized theme from https://github.com/altercation/vim-colors-solarized
set termguicolors
set background=dark
colorscheme solarized

" Powerline fonts for vim-airline at https://github.com/vim-airline/vim-airline
" Install via: sudo apt-get install fonts-powerline
" Does unfortunately show weird symbols on Ubuntu 18.04 with gvim ...
" See: https://github.com/powerline/fonts/issues/281
" let g:airline_powerline_fonts = 1

" Enable mouse support for a(ll) modes
set mouse=a

if has('nvim')
  " Copy text with mouse
  " See https://github.com/neovim/neovim/wiki/FAQ#copying-to-x11-primary-selection-with-the-mouse-doesnt-work
  vmap <LeftRelease> "*ygv
else
  " GVim
  set guifont=Liberation\ Mono\ 12
endif

" use Bash-like filename completion
set wildmode=longest,list,full
set wildmenu

" highlight all search matches
set hlsearch

filetype indent on

" use vim-airline from the start
set laststatus=2

" disable cursor blinking
set guicursor=a:blinkon0

" backspace in first character of line will go to previous line
set backspace=indent,eol,start

" spell checking
autocmd BufNewFile,BufRead *.md set spell

" upper-case ML file suffix (used in Isabelle source)
autocmd BufNewFile,BufRead *.ML set filetype=sml
