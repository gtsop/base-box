#!/usr/bin/env bats

@test "piu is installed" {
  run which pius

  [ "$status" -eq 0 ] || {
    echo '# Suggested solution: $ ./install-piu.sh' >&2
    return 1
  }
}

@test "vim is installed" {
  run which vim

  [ "$status" -eq 0 ] || {
    echo '# Suggested solution: $ ./install-vim.sh' >&2
    return 1
  }
}
