""""""""""""""""""""""""""""""" plugin configs

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'vim-scripts/a.vim'
Plugin 'whonore/coqtail'
Plugin 'xavierd/clang_complete'
call vundle#end()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'minimalist'

" cpp-enhanced-highlight
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_posix_standard = 1

let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_auto_select=1

"""""""""""""""""""""""""""""""" builtin configs

syntax on
colorscheme onehalfdark " put here to change syntax coloring only

" use the default background color of the terminal
highlight LineNr ctermbg=None ctermfg=None
highlight Normal ctermbg=None ctermfg=None

" show added/changed/deleted lines using git
highlight GitGutterAdd    ctermbg=None ctermfg=green
highlight GitGutterChange ctermbg=None ctermfg=yellow
highlight GitGutterDelete ctermbg=None ctermfg=red

" configs for the current line/column
"set cursorcolumn
set cursorline
set number relativenumber
"highlight CursorColumn ctermbg=235 ctermfg=None cterm=None
highlight CursorLine   ctermbg=None ctermfg=None cterm=underline
highlight CursorLineNr ctermfg=blue

" mark 100th column
set colorcolumn=100
highlight ColorColumn ctermbg=None ctermfg=None cterm=underline

" clicking `r` runs `source ~/.vimrc`
nnoremap r :e \| :source $MYVIMRC<CR>

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

" keep this distance from top/bottom
set so=8

" auto saving
set updatetime=2000  " trigger 2000 ms after inactivity
autocmd CursorHold,CursorHoldI,InsertLeave <buffer> write
