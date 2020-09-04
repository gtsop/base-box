#!/usr/bin/env bats

load ../lib/stub.sh/stub.sh
load ./helpers.sh

@test "get_os works for linux" {
  stub_and_echo uname "Linux"

  get_os result

  [ "$result" == "linux" ]
}

@test "get_os works for osx" {
  stub_and_echo uname "Darwin"

  get_os result

  [ "$result" == "osx" ]
}

teardown() {
  restore uname
}
