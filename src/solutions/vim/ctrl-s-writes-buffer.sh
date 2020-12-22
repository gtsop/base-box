#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

function solution() {
  # https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
  cat <<EOF
nnoremap <c-s>      :w<CR>
vnoremap <c-s> <Esc>:w<CR>
inoremap <c-s> <Esc>:w<CR>
EOF
}

wrap_solution solution '"' >> ~/.vimrc
