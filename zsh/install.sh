#!/bin/sh

source $HOME/.dotfiles/_ensure_link.sh
echo "--- setup zsh ---"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install oh-my-zshplugins

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-better-npm-completion" ]; then
  git clone --depth=1 https://github.com/lukechilds/zsh-better-npm-completion $HOME/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
fi


ensure_link "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ensure_link "$HOME/.dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
