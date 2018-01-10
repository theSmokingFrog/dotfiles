#!/usr/bin/env bash

function doIt() {
    echo "»» Syncing dotfiles...";
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".gitignore" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".idea" \
        -avh --no-perms . ~;
    echo "»» Syncing done!";
    echo "»» Reload ~/.bash_profile to see changes!";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "»» This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
