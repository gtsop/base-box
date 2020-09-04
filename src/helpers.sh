#!/usr/bin/env bash

function exit_message () {
  echo "# $1"  >&2
  return 1
}

function solution () {
  exit_message "Solution: src/solutions/$1"
}
