#!/bin/sh

source $HOME/.dotfiles/_ensure_link.sh

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "--- install brew ---"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
echo "--- update brew ---"
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "--- install applications via brewfile ---"
brew tap "homebrew/bundle", "git@github.com:homebrew/homebrew-bundle"
brew bundle --file=$HOME/.dotfiles/brew/Brewfile
