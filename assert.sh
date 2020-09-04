#!/usr/bin/env bash

source ./src/helpers.sh
get_os os_name

echo "1) Cross-platform checks"
echo ""
bats acceptance.bats

echo "2) OS-specfic tests: $os_name"
echo ""
[ "$os_name" == "osx" ] && bats ./acceptance.osx.bats
