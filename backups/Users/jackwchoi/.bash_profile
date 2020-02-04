# paths
export PATH="$(getconf PATH)"  # prevents `r` from duplicating $PATH
export PATH="/Library/TeX/texbin:$PATH"
export PATH="/usr/local/sbin:$PATH"  # for clamd
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
export PATH="$HOME/.cargo/bin:$PATH"

# used to be dropbox
export WORKSPACE="$HOME/tresor-jack"

# personal
export PATH="$WORKSPACE/projects/execs:$PATH"

export SCALA_HOME='/usr/local/opt/scala'

# need to wrap non-printable sequences in \[ and \]
# http://pueblo.sourceforge.net/doc/manual/ansi_color_codes.html
SET_FG_COLOR='\[\e\033[34m'
RESET_ALL='\[\e\033[0m'

# http://man7.org/linux/man-pages/man3/strftime.3.html
export PS1="\n$SET_FG_COLOR\w\n  $ $RESET_ALL"  # simple; for tmux

# colorize `ls` output
BLUE='34'
CYAN='36'
GREEN='32'
GREY='37'
ORANGE='33'
PURPLE='35'
RED='31'
#export LS_COLORS="di=0;$PURPLE:ln=0;$CYAN:ex=0;$GREEN"

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

# default options
#alias tree='tree -aCF'  # colorize output
alias ag="ag --case-sensitive --color-line-number=$GREY --color-match=$RED --color-path=$CYAN --hidden --file-search-regex"
alias athena='ssh athena.dialup.mit.edu -l' # username
alias bat='bat --color always --decorations always --map-syntax h:cpp --map-syntax hpp:cpp'
alias batp='bat --style plain'
alias broot='broot --gitignore no --hidden'
alias c='cargo'
alias chrome='chrome-cli'
alias ciaa='cargo install-update --all'
alias clam='clamdscan --fdpass --infected --multiscan --verbose'
alias clean="clear && printf '\033[3J' && ~/run.sh -c && history -c"
alias clear="clear && printf '\033[3J'"
alias fd='fd --hidden --no-ignore'
alias fzf='fzf --border --color=dark,hl:9,hl+:9,bg+:-1 --inline-info'
alias g='git'
alias grep='grep --perl-regexp --color=auto'
alias gs='git status'
alias gss='git status --short'
alias htop='htop --delay=20'
alias jrepl='julia -ie "using LinearAlgebra; using RowEchelon"'
alias les='less --long-prompt --ignore-case --shift .0625 --status-column --RAW-CONTROL-CHARS'
alias less='les --chop-long-lines'
alias ls='exa --all --classify'
alias mkdir='mkdir --parents --verbose'
alias mv='mv --interactive --verbose'
alias ncdu='ncdu -rr --color dark'
alias nload='nload devices en7 -u H'
alias oxipng='oxipng --opt 4 --interlace 1 --strip safe'
alias p='parallel'
alias pip='pip3'
alias python='python3'
alias ql='qlmanage -p'
alias r='source ~/.bash_profile'
alias rg='rg --hidden --smart-case --unrestricted'
alias rm='rm --verbose'
alias sed='sed --regexp-extended'
alias sk='sk --inline-info --multi --prompt "$ " --color matched:1,matched_bg:-1,info:-1,current_bg:239,current_match:1,current_match_bg:239,prompt:4,cursor:1'
alias speedtest='speedtest --secure --bytes --simple'
alias ti='termimage --ansi truecolor'
alias tree='exa --all --classify --tree'
alias which='alias | gwhich --read-alias --show-dot --show-tilde'
alias wrf='while read f; do'
alias xargs='xargs --delimiter "\n"'
alias youtube-dl='youtube-dl --no-cache-dir'

# for easy cd'ing
alias clas="$WORKSPACE/mit/senior/fall"
alias proj="$WORKSPACE/projects"
alias 035="$WORKSPACE/mit/senior/fall/6.035/fa19"
alias tmp="$WORKSPACE/temps"

# shell options
shopt -s autocd cdspell globstar gnu_errfmt

cal -3
date

# starship on, iff terminal because alacritty doesn't support ligatures
if [[ "$TERM_PROGRAM" == 'Apple_Terminal' ]]; then
  eval "$(starship init bash)"
fi

neofetch --shell_path on --memory_display infobar
