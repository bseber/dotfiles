#!/bin/sh

source $HOME/.dotfiles/_ensure_link.sh
echo "--- setup git ---"

ensure_link "$HOME/.dotfiles/git/gitinclude" "$HOME/.gitinclude"
ensure_link "$HOME/.dotfiles/git/.gitconfig" "$HOME/.gitconfig"
ensure_link "$HOME/.dotfiles/git/.gitignore_global" "$HOME/.gitignore_global"

echo "remember to add `~/.gitconfig.local` file with signingkey and dir specific gitincludes."
