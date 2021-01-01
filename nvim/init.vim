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
" Initialize plugin system
call plug#end()

" basic
filetype plugin indent on " required
syntax on set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
    
" Theme 
" so I dont have to type :colorscheme gruvbox command
colorscheme gruvbox


" Preferences
" To map keys that work only in the insert and replace modes, use the 'imap' or 'inoremap' command.
inoremap jk <ESC>
let mapleader = "\<Space>"
" This allows for automatic paste mode
" Start
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" end

" NERDTree 
" any time you type Ctrl-n, :NERDTreeFocus is used - q to close out of it
map <silent> <C-n> :NERDTreeFocus <CR>
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" config for coc
source $HOME/.config/nvim/plug-config/coc.vim


