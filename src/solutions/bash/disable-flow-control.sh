#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

function solution() {
  cat <<EOF
stty -ixon
EOF
}

wrap_solution solution >> ~/.bashrc
