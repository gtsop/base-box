#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

function solution() {
  cat <<EOF
bind - split-window -v
bind | split-window -h
EOF
}

wrap_solution solution >> ~/.tmux.conf
