#!/usr/bin/env bash

BREW_PREFIX=$(brew --prefix)

# Install Brewfile in the current directory
brew bundle

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

unset BREW_PREFIX
