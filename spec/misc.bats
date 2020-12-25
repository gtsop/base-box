#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[MISC]"

@test "$LABEL remap caps lock to escape" {

  check_key_remap() {
    cat /usr/share/X11/xkb/symbols/pc | grep "key <CAPS>" | grep "\[ Escape \]"
  }

  run check_key_remap

  [ "$status" == "0" ] || solution "misc/caps-to-escape.sh"
}

