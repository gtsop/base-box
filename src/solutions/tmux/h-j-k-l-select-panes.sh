#/usr/bin/env bash

function solution() {
	echo "###";
	echo "# Solution: tmux/h-j-k-l-selects-pane";
	echo "###";
	echo "bind h select-pane -L";
	echo "bind j select-pane -D";
	echo "bind k select-pane -U";
	echo "bind l select-pane -R";
}

solution >> ~/.tmux.conf
