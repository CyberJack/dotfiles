#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/go

# eliminates duplicates in *paths
typeset -gU cdpath fpath path

# Zsh search path for executable
path=(
  $HOME/{,s}bin(N)
  $GOPATH/bin
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /usr/games
  $path
)

fpath=(
  $HOME/.zsh/completions
  $fpath
)

# Editor
export VISUAL=vim
if command -v micro > /dev/null 2>&1; then
  export VISUAL=micro
fi
export EDITOR=$VISUAL

# Setup ZSH cache directory
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
  /bin/mkdir -p "$ZSH_CACHE_DIR"
  /bin/chmod 0700 "$ZSH_CACHE_DIR"
fi

# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
