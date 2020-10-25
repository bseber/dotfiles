#!/bin/sh

function plugin {
  name=$(basename "$1")
  target="$HOME/.vim/pack/plugins/start/$name"
  if [ ! -d $target  ]; then
    echo "install vim plugin '$name'"
    mkdir -p $(dirname $target)
    git clone --quiet --depth 1 "$1.git" $target > /dev/null
    if [ -d "$target/doc" ]; then
      echo "create helptags for $name"
      vim -u NONE -c "helptags $target/doc" -c q
    fi
  fi
}

source $HOME/.dotfiles/_ensure_link.sh
echo "--- setup vim ---"

plugin "git@github.com:itchyny/lightline.vim"
plugin "git@github.com:pangloss/vim-javascript"
plugin "git@github.com:maxmellon/vim-jsx-pretty"
plugin "git@github.com:mustache/vim-mustache-handlebars"
plugin "git@github.com:editorconfig/editorconfig-vim"
plugin "git@github.com:editorconfig/editorconfig-vim"
plugin "git@github.com:mattn/emmet-vim"
plugin "git@github.com:dense-analysis/ale"
plugin "git@github.com:maximbaz/lightline-ale"
plugin "git@github.com:severin-lemaignan/vim-minimap"
plugin "git@github.com:ap/vim-css-color"
plugin "git@github.com:prettier/vim-prettier"
plugin "git@github.com:airblade/vim-gitgutter"

ensure_link "$HOME/vim/.vimrc" "$HOME/.vimrc"
