#!/usr/bin/env bats

load ./helpers.sh

@test "getOSName works for linux" {
  skip "no way to stub yet"
  # stub_and_echo uname "Linux"

  getOSName result

  [ "$result" == "linux" ]
}

@test "getOSName works for osx" {
  # stub_and_echo uname "Darwin"

  getOSName result

  [ "$result" == "osx" ]
}


