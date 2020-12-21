#!/usr/bin/env bats

load ./src/helpers.sh

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
