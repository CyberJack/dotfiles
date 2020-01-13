#!/usr/bin/env bash

echo "Installing dotfiles"

FORCED_INSTALL=false
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  FORCED_INSTALL=true
fi

if [[ "$FORCED_INSTALL" = false ]]; then
  read -p -r "This may overwrite existing files in your home directory. Are you sure? [y/N] " -n 1;
  echo "";
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

rsync --exclude ".git/" \
  --exclude "install.sh" \
  --exclude "README.md" \
  -avh --no-perms . ~;
