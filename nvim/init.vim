set nocompatible
filetype off " required
            
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
" for git
Plug 'tpope/vim-fugitive'
" file explore
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" search files with Ctrl-p 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
" allow you to move between Vim panes and kitty splits seamlessly.
Plug 'knubie/vim-kitty-navigator'

" Initialize plugin system
call plug#end()

" basic
filetype plugin indent on " required
syntax on set number
set relativenumber
set incsearch
" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc.
set ignorecase "searches will be case-insensitive
set smartcase
set nohlsearch " makes it so all of the words aren't highlighted, able to focus on one at a time
set nobackup
set noswapfile
set nowrap
set expandtab " Insert spaces instead of tabs
set smarttab " forces use of shiftwidth and tabstop
set shiftwidth=4 " Change the number of spaces inserted for indentation
set tabstop=4 " Tabs insert 4 space
set softtabstop=4
set laststatus=2
    
" Theme 
" so I dont have to type :colorscheme gruvbox command
colorscheme gruvbox
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Preferences
" To map keys that work only in the insert and replace modes, use the 'imap' or 'inoremap' command.
let mapleader = ","
inoremap jk <ESC>
" cursor to end of linse
noremap Y y$
noremap D d$
" swap two lines start at the lower one
noremap <leader>s VdkP
let mapleader = "\<Space>"
" This allows for automatic paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" NERDTree Settings 
nmap <C-t> :NERDTreeToggle <CR>
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
" open NerdTree Auto
autocmd VimEnter * NERDTree
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Kitty Nav
let g:kitty_navigator_no_mappings = 1
nnoremap <silent> <Tab><Left> :KittyNavigateLeft<cr>
nnoremap <silent> <Tab><Down> :KittyNavigateDown<cr>
nnoremap <silent> <Tab><Up> :KittyNavigateUp<cr>
nnoremap <silent> <Tab><Right> :KittyNavigateRight<cr>

" config for coc
source $HOME/.config/nvim/plug-config/coc.vim


