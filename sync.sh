#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function syncToHome() {
  rsync --exclude ".git/" \
    --exclude "sync.sh" \
    --exclude "README.md" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  syncToHome;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    syncToHome;
  fi;
fi;

unset syncToHome;
