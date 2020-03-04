" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'let-def/vimbufsync'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'whonore/coqtail'
call vundle#end()

" vim airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'minimalist'

syntax on
colorscheme onehalfdark

" use the default background color of the terminal
highlight LineNr ctermbg=None ctermfg=None
highlight Normal ctermbg=None ctermfg=None

" white underline for the selected line
set cursorline
"set cursorcolumn
highlight CursorLine   ctermbg=None ctermfg=None cterm=underline
"highlight CursorColumn ctermbg=235 ctermfg=None cterm=None

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
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" cpp-enhanced-highlight
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_posix_standard = 1

" keep this distance from top/bottom
set so=8

set updatetime=2000
autocmd CursorHold,CursorHoldI,InsertLeave <buffer> write
