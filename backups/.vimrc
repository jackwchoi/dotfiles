" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" vim-plug setup
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'townk/vim-autoclose'
call plug#end()

" vim airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'minimalist'

syntax on
colorscheme onehalfdark

" use the default background color of the terminal
highlight LineNr ctermbg=None ctermfg=None
highlight Normal ctermbg=None ctermfg=None

" white underline for the selected line
set cursorline
highlight CursorLine ctermbg=None ctermfg=None cterm=underline

" show added/changed/deleted lines using git
highlight GitGutterAdd    ctermbg=None ctermfg=green
highlight GitGutterChange ctermbg=None ctermfg=yellow
highlight GitGutterDelete ctermbg=None ctermfg=red

" run `source ~/.vimrc`
nnoremap r :e \| :source $MYVIMRC<CR>

" turn hybrid line numbers on
set number relativenumber
highlight CursorLineNr ctermfg=blue

" file saving
set nowritebackup
set backupcopy=yes

" searching
set hlsearch
set incsearch
set smartcase

" tabs and deletion
set backspace=indent,eol,start
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" keep this distance from top/bottom
set so=8
