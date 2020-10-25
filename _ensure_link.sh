#!/bin/sh

function ensure_link {
  if [ ! -f $2 ]; then
    ln -sv $1 $2
  fi
}
