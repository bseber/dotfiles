#!/bin/sh

source $HOME/.dotfiles/_ensure_link.sh
echo "--- setup iterm2 ---"

# use custom preferences file ./com.googlecode.iterm2.plist
defaults write com.googlecode.iterm2 PrefsCustomFolder $HOME/.dotfiles/iterm2
