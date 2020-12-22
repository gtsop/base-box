#/usr/bin/evn bats

load ../src/helpers.sh

LABEL="[VIM]"

tmp_dir=''

setup() {
  tmp_dir=`mktemp -d`
}

@test "$LABEL loads nerdtree" {

  nerdtree_is_loaded() {
    vim -c "redir > $tmp_dir/scriptnames.txt | silent scriptnames | redir END" -c q

    cat $tmp_dir/scriptnames.txt | grep "NERD_tree.vim"
  }

  run nerdtree_is_loaded 

  [ "$status" == "0" ] || solution "vim/install-nerdtree.sh"
}

@test "$LABEL supports toml syntax" {

  supports_toml() {
    vim test.toml -c "redir > $tmp_dir/test-toml.txt | silent set filetype? | redir END" -c q

    cat $tmp_dir/test-toml.txt | grep toml
  }

  run supports_toml

  [ "$status" == "0" ] || solution "vim/install-vim-toml.sh"
}

teardown() {
  rm -rf $tmp_dir
}
