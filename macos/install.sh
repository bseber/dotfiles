#!/bin/sh
# https://github.com/herrbischoff/awesome-macos-command-line/blob/master/README.md

echo "--- setup macos ---"

# ------------------------------------------------------
echo "safari"

echo "  Setting up developer tools"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

# ------------------------------------------------------
echo "finder"

echo "  Enabling text selection in quicklook"
defaults write com.apple.finder qlenabletextselection -bool true

echo "  Setting list view as Finder default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "  Disabling extension change warning in finder"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "  Show Full Path in Finder Title"
defaults write com.apple.finder ShowPathbar -bool true

echo "  Showing all Finder extensions"
defaults write -g AppleShowAllExtensions -bool true

echo "  Showing ~/Library"
chflags nohidden ~/Library

echo "  Show Network Volumes (AFP, SMB, NFS, WebDAV, etc.)"
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

echo "  Speeding up animations"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write -g nswindowresizetime -float 0.001
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0.25

echo "  Expand Save Panel by Default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

killall Finder

# ------------------------------------------------------
echo "dock"

echo "  show hidden app icons"
defaults write com.apple.dock showhidden -bool true

echo "  hide recent apps"
defaults write com.apple.dock show-recents -bool false

echo "  Disable Auto Rearrange Spaces Based on Most Recent Use"
defaults write com.apple.dock mru-spaces -bool false

echo "  Setting to minimal and hidden"
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 34
defaults write com.apple.dock mineffect scale
defaults write com.apple.dock static-only -bool true

echo "  Speeding up animations"
defaults write com.apple.dock autohide-time-modifier -float 0.25
defaults write com.apple.dock expose-animation-duration -float 0.25
defaults write -g nswindowresizetime -float 0.001
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0.25
defaults write com.apple.finder DisableAllAnimations -bool true

killall Dock

# ------------------------------------------------------

echo "enable keyboard key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Speeding up keyboard repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Disabling autocorrect, use Alfred"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "enable AirDrop over Ethernet on Unsupported Macs"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true && \
defaults remove com.apple.NetworkBrowser DisableAirDrop
