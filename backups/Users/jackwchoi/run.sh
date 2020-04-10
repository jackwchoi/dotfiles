#!/usr/bin/env bash

# getopt --test; echo $?
# this returns 4 if using getopt(3)

# parse options and args
declare -r SHORT_OPS='cfqrsuC'
declare -r LONG_OPS='clean,full-start,quick-start,restart,shutdown,update,full-clean'
declare -r OPTS=$(getopt --unquoted --options $SHORT_OPS --longoptions $LONG_OPS -- "$@") PARSED=$?

# exit if parsing failed
[[ $PARSED != 0 ]] && exit 1

# set as $@
set -- $OPTS

CLEAN=false
FULL_CLEAN=false
RESTART=false
SHUTDOWN=false
START_FULL=false
START_QUICK=false
UPDATE=false
while true; do
  case $1 in
    -c | --clean )        CLEAN=true;        shift;;
    -C | --full-clean )   FULL_CLEAN=true;   shift;;
    -f | --full-start )   START_FULL=true;   shift;;
    -q | --quick-start )  START_QUICK=true;  shift;;
    -r | --restart )      RESTART=true;      shift;;
    -s | --shutdown )     SHUTDOWN=true;     shift;;
    -u | --update )       UPDATE=true;       shift;;
    * )  # specifically "--"
      shift; break;;
  esac
done

# echo with one \n prepended, and in red
function necho {
  echo -e "\n\e[31m$1\e[0m" >&2
}

# rewrite this using rust regexset
function clean_quick {
  : | pbcopy
  necho 'Emptying trash...'
  empty-trash &

  necho 'Cleaning files...'
  declare -r REPL='(bash|julia|node_repl|scala|python|sqlite|zsh)_(history|sessions)'
  declare -r MISC='(cups|rnd|viminfo|DS_Store|putty|dbshell|history|aspell\.en\.(prepl|pws)|ipynb_checkpoints|grip|wget-hsts|ipython|lesshst|matplotlib|oracle_jre_usage|pdfbox\.cache|plotly|tooling|swp)'
  {
    find ~/ -maxdepth 1
    find "$WORKSPACE"
    find ~/{Desktop,Documents,Downloads}/
    find ~/tresor-*
  } |
    rg "/(\.$REPL|\.$MISC|__pycache__)$" |
    rmf -t

  necho 'Cleaning caches...'
  rmf -t ~/Library/Webkit/com.apple.Safari \
         ~/Library/Caches/{Google,Homebrew,qlmanage,Firefox} \
         ~/Library/Caches/com.apple.{Safari,Safari.SafeBrowsing,Spotlight,QuickLookDaemon,finder} \
         ~/Library/Caches/com.google.{Keystone,Keystone.Agent,SoftwareUpdate} \
         ~/Library/Caches/BraveSoftware \
         ~/Library/Caches/com.brave.Browser \
         ~/.tor/ \
         ~/Library/Caches/co.zeit.hyper \
         ~/Library/Saved\ Application\ State

  qlmanage -r

  : | pbcopy
  wait
}

function clean_full {
  necho 'Cleaning Safari...'
  clean-safari
  clean-safari

  clean_quick &
  wait

  necho 'Cleaning Atom...'
  apm clean

  necho 'Uninstalling HomeBrew formula not in Brewfile...'
  brew bundle cleanup --force --file="$BREWFILE"

  necho 'Removing HomeBrew caches and old versions...'
  brew cleanup
}

# reads from pipe and opens each app
# assumes that given an app name $name, /Applications/$name.app exists
function open_apps {
  for APP_NAME in "$@"; do
    echo "Opening $APP_NAME..." >&2
    open "/Applications/$APP_NAME.app" &
  done
  wait
}

function update {
  necho 'Updating HomeBrew...'
  brew update
  necho 'Upgrading HomeBrew...'
  brew upgrade

  necho 'Updating Rust...'
  rustup update
  rustup component add rustfmt
  cargo install-update --all

  necho 'Updating Vim...'
  vim +PluginInstall +qall
  vim +PluginUpdate +qall

  necho 'Updating pip...'
  pip3 install --upgrade pip
  pip3 install plotly

  necho 'Updating Atom...'
  apm update --no-confirm
}

if $CLEAN; then
  necho 'Performing QUICK CLEAN...'
  clean_quick
elif $FULL_CLEAN; then
  necho 'Performing FULL CLEAN...'
  clean_full
fi

if $START_FULL; then
  necho 'Performing START_FULL...'

  open_apps 'ProtonVPN' 'Tresorit' &

  necho 'Checking Emails...'
  check-email &

  necho 'Refreshing Calendar...'
  refresh-calendar &> /dev/null &

  weather &

  wait
elif $START_QUICK; then
  necho 'Performing START_QUICK...'
  open_apps 'ProtonVPN' 'Tresorit'
fi

if $UPDATE; then
  necho 'Performing UPDATE...'
  update
fi

if $SHUTDOWN; then
  necho 'Performing SHUTDOWN...'
  shutdown
elif $RESTART; then
  necho 'Performing RESTART...'
  restart
fi
