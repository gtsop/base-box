#!/usr/bin/env bats

load ./src/helpers.sh

setup() {
  tmux new-session -s base-box-test -d
}

@test "piu is installed" {
  run which piu

  [ "$status" -eq 0 ] || solution 'install-piu.sh'
}

@test "git is installed" {
  run which git

  [ "$status" -eq 0 ] || solution "install-git.sh"
}

@test "vim is installed" {
  run which vim

  [ "$status" -eq 0 ] || solution "install-vim.sh"
}

@test "alacritty is installed" {
  run which alacritty

  [ "$status" -eq 0 ] || solution "install-alacritty.sh"
}

@test "tmux is installed" {
  run which tmux

  [ "$status" -eq 0 ] || solution "install-tmux.sh"
}

@test "tmux uses Ctrl+A as the prefix" {
  ctrl_a_bind() {
    tmux list-keys | grep " prefix " | grep "C-a" | grep "send-prefix"
  }

  run ctrl_a_bind

  [ "$status" -eq 0 ] || solution "tmux/ctrl-a-prefix.sh"
}

teardown() {
  tmux kill-session -t base-box-test
}
