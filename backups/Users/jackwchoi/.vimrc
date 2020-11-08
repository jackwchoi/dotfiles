set nocompatible

" vundle
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'let-def/vimbufsync'                " dependency for coqtail
  Plugin 'lifepillar/vim-mucomplete'         " auto-completion
  Plugin 'majutsushi/tagbar'
  Plugin 'neovimhaskell/haskell-vim'
  Plugin 'octol/vim-cpp-enhanced-highlight'  " better syntax highlighting for C++
  Plugin 'raingo/vim-matlab'
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

" search highlights
highlight Search ctermfg=black ctermbg=white

" mark 100th column
set colorcolumn=128
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
set ignorecase
set smartcase

" tabs and deletion
set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" keep this distance from top/bottom
set so=8

" fzf
let g:fzf_layout = { 'down': '~40%' }

" auto commands
set updatetime=512  " trigger after this many ms of inactivity
autocmd CursorHoldI,InsertLeave * write

command Bat    execute "! clear && bat '%:p'"
command Build  execute "! clear && jvim-build '%:p'"
command BuildL execute "! clear && jvim-build-less '%:p'"
command Format execute "! clear && jvim-fmt '%:p'"
command Run    execute "! clear && jvim-run '%:p'"
command RunL   execute "! clear && jvim-run-less '%:p'"
command Test   execute "! clear && jvim-test  '%:p'"
command TestL  execute "! clear && jvim-test-less '%:p'"
command Copy   execute "! clear && pbcopy < %:p"
command Sk     execute "! sk ."
"alias broot='! clear && \broot . --hidden --show-git-info'

" keymaps
nnoremap ./  :Run<LF>
nnoremap .l  :RunL<LF>
nnoremap bb  :Build<LF>
nnoremap bl  :BuildL<LF>
nnoremap cc  :Copy<LF><LF>
nnoremap ff  :Format<LF>:edit!<LF><LF>
nnoremap fzf :FZF<LF><LF>
nnoremap fzb :Buffers<LF>
nnoremap rr  :source $MYVIMRC<LF>
nnoremap tgs :TagbarToggle<LF>
nnoremap tl  :TestL<LF>
nnoremap tt  :Test<LF>
nnoremap ww  :bd<LF>
nnoremap rg  :Rg 
