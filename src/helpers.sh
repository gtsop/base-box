#!/usr/bin/env bash

function exit_message () {
  echo "# $1"  >&2
  return 1
}

function solution () {
  exit_message "Solution: src/solutions/$1"
}

function get_os {
  # Linux by default
  os_name="linux"

  # Detect OSX
  is_darwin=`uname -a | grep Darwin > /dev/null; echo $?`
  if [ "$is_darwin" == "0" ]
  then
    os_name="osx"
  fi

  eval "$1=$os_name"
}
