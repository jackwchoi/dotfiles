""""""""""""""""""""""""""""""" plugin configs
 
" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'let-def/vimbufsync'                " dependency for coqtail
Plugin 'lifepillar/vim-mucomplete'         " auto-completion
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'  " better syntax highlighting for C++
Plugin 'reedes/vim-pencil'
Plugin 'rust-lang/rust.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-syntastic/syntastic'  " simple C++ syntax checker
Plugin 'whonore/coqtail'          " Coq plugin
Plugin 'xavierd/clang_complete'   " C++ auto-completion
call vundle#end()
filetype plugin indent on

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

" syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++17 -Wall -O0'
let g:syntastic_cpp_no_default_include_dirs = 1
let g:syntastic_cpp_no_include_search = 1

" clang_complete
let g:clang_auto_select=1
let g:clang_close_preview=1
let g:clang_complete_auto = 1
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
let g:clang_snippets=1
let g:clang_trailing_placeholder=1
let g:clang_user_options = '-std=c++17 -Wall -O0'

" mucomplete
set infercase
set completeopt=""
set completeopt+=menu,noinsert
set completeopt-=longest,menunuopt,preview,popup,noselect,menuone,popuphidden
set shortmess+=c
let g:mucomplete#completion_delay = 1
let g:mucomplete#enable_auto_at_startup = 1

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

" file saving
set backupcopy=yes
set noswapfile
set nowritebackup

" etc
set history=16

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
set so=4

" auto commands
set updatetime=512  " trigger after this many ms of inactivity
autocmd CursorHoldI,InsertLeave * write  

command ClangFormat execute "! clear && [[ '%:e' == cpp || '%:e' == hpp ]] && clang-format -i '%:p' || cargo fmt"
command Exec        execute "! clear && %:p"
command Make        execute "! clear && [[ -f Makefile ]] && make --print-directory"

" keymaps
nnoremap bb  :Make<LF>
nnoremap ee  :Exec<LF>
nnoremap ff  :ClangFormat<LF>:edit!<LF><LF>
nnoremap fzf :FZF<LF>
nnoremap rr  :source $MYVIMRC<LF>
nnoremap tt  :TagbarToggle<LF>
nnoremap ww  :bd<LF>
