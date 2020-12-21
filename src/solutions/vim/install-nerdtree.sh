#/usr/bin/env bash

function solution() {
  # https://github.com/preservim/nerdtree

  git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree

  vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
}

solution
