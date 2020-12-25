#!/usr/bin/env bash

source ./src/helpers.sh
get_os os_name

echo "1) Cross-platform checks"
echo ""
bats acceptance.bats
bats spec/bash.bats
bats spec/misc.bats
bats spec/tmux.bats
bats spec/vim.bats

echo "2) OS-specfic tests: $os_name"
echo ""
[ "$os_name" == "osx" ] && bats ./acceptance.osx.bats
