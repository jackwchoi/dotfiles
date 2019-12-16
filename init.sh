#!/usr/bin/env bash
# the idea is to have this file essentailly unpack dotfiles to take effect

echo 'init.sh: unimplemented'
exit 1

# Homebrew
if ! brew --version; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew bundle install --file='manual-backups/Brewfile'
fi

# Rust
if ! rustup --version; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Vim Plug
if ! [[ -f "$HOME/.vim/autoload/plug.vim" ]]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  vim +PlugInstall +qall
fi

# Vundle
if ! [[ -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
  git clone 'https://github.com/VundleVim/Vundle.vim.git' ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi
