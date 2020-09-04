#!/usr/bin/env bats

load ./src/helpers.sh

@test "brew is installed" {
  run which brew

  [ "$status" -eq 0 ] || solution 'install-brew.sh'
}

@test "System policy assessments are disabled" {
  run spctl --status

  [ "$output" == "assessments disabled" ] || solution "osx/spctl-disable.sh"
}
