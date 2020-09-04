#!/usr/bin/env bats

load ./src/helpers.sh

@test "brew is installed" {
  run which brew

  [ "$status" -eq 0 ] || solution 'install-brew.sh'
}
