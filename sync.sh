#!/usr/bin/env bash

declare -r ROOT=$(git rev-parse --show-toplevel)
declare -r BACKUPS="$ROOT/backups"
declare -r MANUAL_BACKUPS="$ROOT/manual-backups"

# print to stderr, using green font
function green {
  echo -e "\e[32m$@\e[0m" >&2
}

# $1 -> some filepath such that "$HOME/$1" exists
# recursively copy "$HOME/$1" to "$BACKUPS/$1"
function jsync {
  declare -r FSTRIP=$(sed -E 's/^\/+//' <<< "$1")
  mkdir --parents "$(dirname "$BACKUPS/$FSTRIP")" &&
    cp -rv "/$FSTRIP" "$(dirname "$BACKUPS/$FSTRIP")/"
}

export ROOT BACKUPS BACKUPS
export -f jsync

green 'saving custom files... &'
"$ROOT/lambda.sh" |
  parallel 'jsync {}' &

mkdir -p "$BACKUPS/"

green 'saving brew configs... &'
brew bundle dump --force --file="$MANUAL_BACKUPS/Brewfile" &

green 'saving atom configs and packages... &'
apm list --installed --bare |
  rg -o '^[^@]+' > "$MANUAL_BACKUPS/atom-packages.txt" &

green 'saving cargo packages...& '
cargo install --list |
  rg -o '^\S+' > "$MANUAL_BACKUPS/cargo_packages.txt" &

cp ~/Library/Application\ Support/Firefox/Profiles/*/user.js "$MANUAL_BACKUPS/user.js"

wait
