#/usr/bin/env bash

function solution() {
	echo "###";
	echo "# Solution: tmux/ctrl-a-prefix.sh";
	echo "###";
	echo "set -g prefix C-a";
	echo "unbind C-b";
	echo "bind C-a send-prefix";
}

solution >> ~/.tmux.conf
