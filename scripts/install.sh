#!/bin/sh

source $HOME/.dotfiles/_ensure_link.sh
echo "--- setup startup user agents ---"

# encrypted backup of '~/Documents/private'
FOLDER=~/Documents/private
if [ ! -f $HOME/Library/LaunchAgents/com.startup.documents.private.backup.plist ]; then
  if read -q "confirm?Do you want to automatically backup '$FOLDER'? [y|N] "; then
    ln -s $HOME/.dotfiles/scripts/startup/com.startup.documents.private.backup.plist $HOME/Library/LaunchAgents/com.startup.documents.private.backup.plist
    launchctl load -w $HOME/Library/LaunchAgents/com.startup.documents.private.backup.plist
  else
    echo "stopping backup task for '$FOLDER'"
    launchctl unload $HOME/Library/LaunchAgents/com.startup.documents.private.backup.plist
  fi
fi
