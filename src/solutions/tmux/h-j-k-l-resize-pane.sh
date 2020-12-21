#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

function solution() {
  cat <<EOF
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5 
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
EOF
}

wrap_solution solution >> ~/.tmux.conf
