# add custom zsh functions to fpath, and then lazy autoload
# every file in there as a function
fpath=(~/dotfiles/zsh/functions $fpath);
autoload -U $fpath[1]/*(.:t)
