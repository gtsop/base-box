#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[VIM]"

setup_file() {
  export tmp_dir=`mktemp -d`

  vim -c "redir > $tmp_dir/scriptnames.txt | silent scriptnames | redir END" \
      -c "redir > $tmp_dir/nmap.txt        | silent nmap        | redir END" \
      -c "redir > $tmp_dir/imap.txt        | silent imap        | redir END" \
      -c "redir > $tmp_dir/vmap.txt        | silent vmap        | redir END" \
      -c "edit $tmp_dir/test.toml" \
      -c "redir > $tmp_dir/test-toml.txt | silent set filetype? | redir END" \
      -c "redir > $tmp_dir/diagnostics.txt | echo \"swapfile:\" &swapfile | redir END" \
      -c q
}

@test "$LABEL loads nerdtree" {

  nerdtree_is_loaded() {
    cat $tmp_dir/scriptnames.txt | grep "NERD_tree.vim"
  }

  run nerdtree_is_loaded 

  [ "$status" == "0" ] || solution "vim/install-nerdtree.sh"
}

@test "$LABEL supports toml syntax" {

  supports_toml() {
    cat $tmp_dir/test-toml.txt | grep toml
  }

  run supports_toml

  [ "$status" == "0" ] || solution "vim/install-vim-toml.sh"
}

@test "$LABEL uses Ctrl+S to write changes on current buffer" {
  maps_ctrl_s() {
    cat $tmp_dir/nmap.txt | grep -i "<C-S>" | grep ":w<CR>" &&
    cat $tmp_dir/imap.txt | grep -i "<C-S>" | grep ":w<CR>" &&
    cat $tmp_dir/vmap.txt | grep -i "<C-S>" | grep ":w<CR>"
  }

  run maps_ctrl_s

  [ "$status" == "0" ] || solution "vim/ctrl-s-writes-buffer.sh"
}

@test "$LABEL swapfile is turned off" {

  swap_is_off() {
    cat $tmp_dir/diagnostics.txt | grep "swapfile: 0"
  }

  run swap_is_off

  [ "$status" == "0" ] || solution "vim/disable-swapfile.sh"
}

teardown_file() {
  rm -rf $tmp_dir
}
