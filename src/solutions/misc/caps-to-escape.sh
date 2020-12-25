#!/bin/bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

solution() {
  pc_file=/usr/share/X11/xkb/symbols/pc
  tmp_file=`mktemp`
  
  backup $pc_file

  line_number=`grep -n "^};" $pc_file | head -1 | cut -d : -f 1`

  head "-$((line_number-1))" $pc_file >> $tmp_file
  echo "key <CAPS>{   [ Escape ] };" >> $tmp_file
  tail -n +"$((line_number))" $pc_file >> $tmp_file

  cp $tmp_file $pc_file
}

solution
