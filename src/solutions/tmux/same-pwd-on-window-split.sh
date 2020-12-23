#/usr/bin/env bash

source "${BASH_SOURCE%/*}/../../helpers.sh"

config_file=~/.tmux.conf

function apply() {
  backup ~/.tmux.conf

  fix="-c \"\#\{pane_current_path\}\""

  sed -i "s/split-window -v/split-window -v $fix/" $config_file
  sed -i "s/split-window -h/split-window -h $fix/" $config_file 
}

function solution() {
  
  echo "The following lines will be overwritten to apply the solution:"
  cat $config_file | grep "split-window -v"
  cat $config_file | grep "split-window -h"

  select confirm in "Yes" "No";
  do
    case $confirm in
      Yes ) apply; break;;
      No ) exit;;
    esac
  done

  echo "Exiting";
}

solution
