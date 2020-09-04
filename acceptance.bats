#!/usr/bin/env bats

load ./src/helpers.sh

@test "piu is installed" {
  run which piu

  [ "$status" -eq 0 ] || solution 'install-piu.sh'
}

@test "vim is installed" {
  run which vim

  [ "$status" -eq 0 ] || solution "install-vim.sh"
}
