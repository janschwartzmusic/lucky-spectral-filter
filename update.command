#!/bin/zsh
set -euo pipefail

source_url="https://raw.githubusercontent.com/janschwartzmusic/lucky-spectral-filter/main/JSchwartz/JSchwartz_Simple_Spectral_Filter.jsfx"
destination="$HOME/Library/Application Support/REAPER/Effects/JSchwartz"
temporary_file="$(mktemp -t JSchwartz_Lucky_Spectral_Filter).jsfx"

cleanup() {
  rm -f "$temporary_file"
}
trap cleanup EXIT

curl -fL --silent --show-error "$source_url" -o "$temporary_file"
grep -q '^desc:JSchwartz Simple Spectral Filter$' "$temporary_file"

mkdir -p "$destination"
install -m 0644 "$temporary_file" \
  "$destination/JSchwartz_Simple_Spectral_Filter.jsfx"

echo "Updated JSchwartz Simple Spectral Filter — Lucky Edition from GitHub."
echo "Installed to:"
echo "$destination/JSchwartz_Simple_Spectral_Filter.jsfx"
