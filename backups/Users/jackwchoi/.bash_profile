# paths
export PATH="$(getconf PATH)"  # prevents `r` from duplicating $PATH
export PATH="/Library/TeX/texbin:$PATH"
export PATH="/usr/local/sbin:$PATH"  # for clamd
export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
# use gnu bin without the g-prefix
export PATH="/usr/local/Cellar/gnu-which/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-time/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
#
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/scala/libexec/bin:$PATH"
export PATH="/usr/local/opt/unzip/bin:$PATH"
export PATH="/usr/local/opt/zip/bin:$PATH"
#
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# used to be dropbox
export WORKSPACE="$HOME/tresor-jack"

# personal
export PATH="$WORKSPACE/execs:$PATH"

export SCALA_HOME='/usr/local/opt/scala'

# need to wrap non-printable sequences in \[ and \]
# http://pueblo.sourceforge.net/doc/manual/ansi_color_codes.html
SET_FG_COLOR='\[\e[34m\]'
RESET_ALL='\[\e[0m\]'

# http://man7.org/linux/man-pages/man3/strftime.3.html
export PS1="\n$SET_FG_COLOR\w\n  $ $RESET_ALL"  # simple; for tmux

# for `man` to work with gnu utils
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# other env vars
export BAT_PAGER=''  # no pager by default
export BAT_STYLE='full'
#export BAT_THEME='OneHalfLight'
export BAT_THEME='OneHalfDark'
export FZF_DEFAULT_COMMAND='\fd .'
#null false true numbers strings arrays objects
export JQ_COLORS='0;31:0;36:0;36:0;33:0;32:0;37:0;37'
export TERM='xterm-256color'
export PAGER='less'

# default options
#alias tree='tree -aCF'  # colorize output
alias athena='ssh athena.dialup.mit.edu -l' # username
alias bat='\bat --color always --decorations always --map-syntax *.hpp:C++ --map-syntax *.hs:Haskell'
alias batp='\bat --style plain'
alias broot='\broot . --hidden --show-gitignored --show-git-info'
alias clam='\clamdscan --fdpass --infected --multiscan --verbose'
alias clean="clear && printf '\e[3J' && ~/run.sh -c && clear && history -c && ls"
alias clear="clear && printf '\e[3J'"
alias c='clear && '
alias fd='\fd --hidden --no-ignore'
alias fdup='\fdup --sort-vec'
alias fzf='\fzf --border --color=dark,hl:9,hl+:9,bg+:-1 --inline-info'
alias grep='\grep --perl-regexp --color=auto'
alias gs='\git status'
alias gss='\git status --short'
alias htop='\htop --delay=20'
alias jrepl='\julia -ie "using LinearAlgebra; using RowEchelon"'
alias les='\less --long-prompt --ignore-case --shift .0625 --status-column --RAW-CONTROL-CHARS'
alias less='\less --long-prompt --ignore-case --shift .0625 --status-column --RAW-CONTROL-CHARS --chop-long-lines'
alias ls='\exa --all --classify'
alias mkdir='\mkdir --parents --verbose'
alias mv='\mv --interactive --verbose'
alias ncdu='\ncdu -rr --color dark'
alias nload='\nload devices en7 -u H'
alias oxipng='\oxipng --opt 4 --interlace 1 --strip safe'
alias p='\parallel'
alias pip='\pip3'
alias python='\python3'
alias ql='\qlmanage -p'
alias rg='\rg --hidden --smart-case --unrestricted'
alias rm='\rm --verbose'
alias s='\source ~/.bash_profile'
alias sed='\sed --regexp-extended'
alias sk='\sk --inline-info --multi --prompt "$ " --case ignore --color matched:1,matched_bg:-1,info:-1,current_bg:239,current_match:1,current_match_bg:239,prompt:4,cursor:1'
alias speedtest='\speedtest --secure --bytes'
alias ti='\termimage --ansi truecolor'
alias tree='\exa --all --classify --tree'
alias which='\alias | gwhich --read-alias --show-dot --show-tilde'
alias wrf='while read f; do'
alias x='\xargs --delimiter "\n"'
alias xargs='\xargs --delimiter "\n"'
alias youtube-dl='youtube-dl --no-cache-dir'

function bt {
   \bat \
      --color always \
      --decorations always \
      --map-syntax *.m:MATLAB \
      --map-syntax *.hpp:C++ \
      --map-syntax *.hs:Haskell \
     "$@"
}
export -f bt

function bl {
  bt "$@" | less
}
export -f bl

function gca {
  git add . &&
    git commit -m "$@"
}
export -f gca

# for easy cd'ing
alias clas="$WORKSPACE/mit/senior/spring"
alias tmp="$WORKSPACE/temps"
alias ws="$WORKSPACE"

# shell options
shopt -s autocd cdspell globstar gnu_errfmt

export SHELL="/usr/local/bin/bash"

neofetch

cal -3
echo
seq 16 |
  while read f; do
    date
  done
source "$HOME/.cargo/env"
