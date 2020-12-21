#!/usr/bin/env bash

set -e

# Install Ubuntu depedencies
piu install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Install alacritty via cargo
cargo install alacritty

# Install desktop file for Ubuntu
exec_path=$(which alacritty)
icon_path=$(locate alacritty.ico)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
file_path="$parent_path/assets/alacritty/alacritty.desktop"
temp_dir=`mktemp -d`
temp_file_path="$temp_dir/alacritty.desktop"

cat $file_path | sed "s%<EXEC>%$exec_path%" | sed "s%<ICON>%$icon_path%" > $temp_file_path

sudo desktop-file-install $temp_file_path

rm -rf $temp_dir
