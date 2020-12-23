#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[TMUX]"

setup_file() {
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

@test "$LABEL uses H,J,J,L to resize panes" {
  check_resize_pane_bindings() {
    tmux list-keys | grep " prefix " | grep " H " | grep "resize-pane -L" &&
    tmux list-keys | grep " prefix " | grep " J " | grep "resize-pane -D" &&
    tmux list-keys | grep " prefix " | grep " K " | grep "resize-pane -U" &&
    tmux list-keys | grep " prefix " | grep " L " | grep "resize-pane -R"
  }

  run check_resize_pane_bindings

  [ "$status" -eq 0 ] || solution "tmux/h-j-k-l-resize-panes.sh"
}

@test "$LABEL has mouse support enabled" {

  mouse_support_on() {
    tmux display-message -p "#{mouse}" | grep "1"
  }

  run mouse_support_on

  [ "$status" -eq 0 ] || solution "tmux/enable-mouse-support.sh"
}

@test "$LABEL uses -,| to split window" {

  check_dash_pipe_split_window () {
    tmux list-keys | grep "bind-key" | grep " - " | grep "split-window -v" &&
    tmux list-keys | grep "bind-key" | grep " | " | grep "split-window -h"
  }

  run check_dash_pipe_split_window

  [ "$status" -eq 0 ] || solution "tmux/dash-pipe-split-windows.sh"
}

@test "$LABEL new splits use the same working directory" {

  check_pwd_on_split() {
    tmux list-keys | grep "split-window -v" | grep "\-c \"#{pane_current_path}\"" &&
    tmux list-keys | grep "split-window -h" | grep "\-c \"#{pane_current_path}\""
  }

  run check_pwd_on_split

  [ "$status" -eq 0 ] || solution "tmux/same-pwd-on-window-split.sh"
}


teardown_file() {
  tmux kill-session -t base-box-test
}
