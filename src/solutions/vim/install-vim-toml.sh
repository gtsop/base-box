#/usr/bin/env bash

function solution() {
  # https://github.com/cespare/vim-toml

  git clone https://github.com/cespare/vim-toml.git ~/.vim/pack/vendor/start/vim-toml

  vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
}

solution
