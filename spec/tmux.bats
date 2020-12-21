#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[TMUX]"

setup() {
  tmux new-session -s base-box-test -d
}

@test "$LABEL uses Ctrl+A as the prefix" {
  ctrl_a_bind() {
    tmux list-keys | grep " prefix " | grep "C-a" | grep "send-prefix"
  }

  run ctrl_a_bind

  [ "$status" -eq 0 ] || solution "tmux/ctrl-a-prefix.sh"
}

@test "$LABEL uses h,j,k,l to select panes" {
  check_select_pane_bindings() {
    tmux list-keys | grep " prefix " | grep " h " | grep "select-pane -L" &&
    tmux list-keys | grep " prefix " | grep " j " | grep "select-pane -D" &&
    tmux list-keys | grep " prefix " | grep " k " | grep "select-pane -U" &&
    tmux list-keys | grep " prefix " | grep " l " | grep "select-pane -R"
  }

  run check_select_pane_bindings

  [ "$status" -eq 0 ] || solution "tmux/h-j-k-l-select-panes.sh"
}

teardown() {
  tmux kill-session -t base-box-test
}
