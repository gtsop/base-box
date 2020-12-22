#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[BASH]"

@test "$LABEL disables flow control" {

  check_ixon_flag() {
    stty -a | grep "\-ixon"
  }

  run check_ixon_flag

  [ "$status" == "0" ] || solution "bash/disable-flow-control.sh"
}

