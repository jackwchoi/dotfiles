#!/usr/bin/env bash

declare -r ROOT=$(dirname "$(realpath $0)")
declare -r BACKUPS="$ROOT/backups"
declare -r MANUAL_BACKUPS="$ROOT/manual-backups"

# print to stderr, using green font
function green {
  echo -e "\e[32m$@\e[0m" >&2
}

# $1 -> some filepath such that "$HOME/$1" exists
# recursively copy "$HOME/$1" to "$BACKUPS/$1"
function jsync {
  declare -r DIRNAME=$(dirname "$1")
  mkdir --parents "$BACKUPS/$DIRNAME" &&
    rsync --archive --human-readable "$HOME/$1" "$BACKUPS/$1"
}

export ROOT BACKUPS MANUAL_BACKUPS
export -f jsync

rm -rf "$BACKUPS/"
mkdir  "$BACKUPS/"

green 'saving brew configs... &'
brew bundle dump --force --file="$MANUAL_BACKUPS/Brewfile" &

green 'saving atom configs and packages... &'
apm list --installed --bare |
  rg -o '^[^@]+' > "$MANUAL_BACKUPS/atom-packages.txt" &

green 'saving cargo packages...& '
cargo install --list |
  rg -o '^\S+' > "$MANUAL_BACKUPS/cargo_packages.txt" &

green 'rsyncing the rest...'
jq '.unencrypted[]' --raw-output < 'config.json' |  # print array elements raw
  sed --regexp-extended 's/\/+$//' |                # remove trailing slashes
  parallel 'jsync {}'

wait
