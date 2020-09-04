#!/usr/bin/env bats

load ./src/helpers.sh

@test "git is installed" {
  run which git

  [ "$status" -eq 0 ] || solution "install-git.sh"
}

@test "piu is installed" {
  run which piu

  [ "$status" -eq 0 ] || solution 'install-piu.sh'
}

@test "vim is installed" {
  run which vim

  [ "$status" -eq 0 ] || solution "install-vim.sh"
}
