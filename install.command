#!/bin/zsh
set -euo pipefail

script_dir="${0:A:h}"
destination="$HOME/Library/Application Support/REAPER/Effects/JSchwartz"

mkdir -p "$destination"
install -m 0644 \
  "$script_dir/JSchwartz/JSchwartz_Simple_Spectral_Filter.jsfx" \
  "$destination/JSchwartz_Simple_Spectral_Filter.jsfx"

echo "Installed JSchwartz Simple Spectral Filter — Lucky Edition to:"
echo "$destination/JSchwartz_Simple_Spectral_Filter.jsfx"
echo "Restart REAPER or rescan JS effects if it is already open."
