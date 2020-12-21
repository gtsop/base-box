#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[VIM]"

tmp_dir=''

setup() {
  tmp_dir=`mktemp -d`
  vim -c "redir > $tmp_dir/scriptnames.txt | silent scriptnames | redir END" -c q
}

@test "$LABEL loads nerdtree" {

  nerdtree_is_loaded() {
    cat $tmp_dir/scriptnames.txt | grep "NERD_tree.vim"
  }

  run nerdtree_is_loaded 

  [ "$status" == "0" ] || solution "vim/install-nerdtree.sh"
}

teardown() {
  rm -rf $tmp_dir
}
