#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

function solution() {
  cat <<EOF
" https://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim#821936
set noswapfile
EOF
}

wrap_solution solution '"' >> ~/.vimrc
