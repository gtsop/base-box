#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

function solution() {
  cat <<EOF
set-option -g mouse on
EOF
}

wrap_solution solution >> ~/.tmux.conf
