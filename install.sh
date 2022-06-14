#!/bin/zsh

set -e

function ensure_link {
  if [ ! -f $2 ]; then
    ln -sv $1 $2
  fi
}

echo "--- install command line tools ---"
xcode-select --install

# ------------------------------------------------------
echo "--- setup homebrew ---"
if test ! $(which brew); then
  echo "install brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew analytics off

echo "--- install applications via brewfile ---"
brew tap "homebrew/bundle", "git@github.com:homebrew/homebrew-bundle"
brew bundle --file=$HOME/dotfiles/Brewfile

# ------------------------------------------------------
echo "--- setup macos ---"
defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"
defaults write NSGlobalDomain AppleAccentColor -int 5
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder qlenabletextselection -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool false
chflags nohidden ~/Library
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write -g nswindowresizetime -float 0.001
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0.25
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 34
defaults write com.apple.dock mineffect scale
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.25
defaults write com.apple.dock expose-animation-duration -float 0.25
defaults write -g nswindowresizetime -float 0.001
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0.25
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
defaults remove com.apple.NetworkBrowser DisableAirDrop

killall Finder
killall Dock

# ------------------------------------------------------
echo "--- setup zsh ---"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-better-npm-completion" ]; then
  git clone --depth=1 https://github.com/lukechilds/zsh-better-npm-completion $HOME/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
fi

# ------------------------------------------------------
echo "--- Install Configuration Files ---"

ensure_link "$HOME/dotfiles/config/.gitconfig" "$HOME/.gitconfig"
ensure_link "$HOME/dotfiles/config/.gitignore_global" "$HOME/.gitignore_global"
ensure_link "$HOME/dotfiles/config/iterm2/com.googlecode.iterm2.plist" "$HOME/.config/iterm2/"
ensure_link "$HOME/dotfiles/config/sketchybar" "$HOME/.config/sketchybar"
ensure_link "$HOME/dotfiles/config/skhd" "$HOME/.config/skhd"
ensure_link "$HOME/dotfiles/config/yabai" "$HOME/.config/yabai"
ensure_link "$HOME/dotfiles/config/.zshrc" "$HOME/.zshrc"
ensure_link "$HOME/dotfiles/config/.zshenv" "$HOME/.zshenv"
ensure_link "$HOME/dotfiles/config/.p10k.zsh" "$HOME/.p10k.zsh"
ensure_link "$HOME/dotfiles/config/.vimrc" "$HOME/.vimrc"

# ------------------------------------------------------
echo ""
echo ""
echo "                      /^--^\     /^--^\     /^--^\                       "
echo " finished setup ♥️     \____/     \____/     \____/                       "
echo " have fun hacking    /      \   /      \   /      \                      "
echo "                    |        | |        | |        |                     "
echo "                     \__  __/   \__  __/   \__  __/                      "
echo "|^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|"
echo "| | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |"
echo "########################/ /######\ \###########/ /#######################"
echo "| | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |"
echo "|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|"
echo ""
echo ""
echo "remember to add:"
echo "  - `~/.gitconfig.local` file with signingkey"
echo "  - dir specific gitincludes"
