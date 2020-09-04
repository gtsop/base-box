#!/usr/bin/env bats

load ../../../lib/stub.sh/stub.sh
load spctl-disable.sh

@test "Disables the system policy assessments" {

  stub spctl

  spctl_disable_assessments

  stub_called_with spctl --master-disable

  restore spctl
}
