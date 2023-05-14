#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -eu

if [[ $(uname -a | grep -i nixos) == 1 ]]; then
  echo "Error: This script is for NixOS"
  exit 1
fi

OUT_DIR=$HOME/.config/nixpkgs
mkdir -p $OUT_DIR
git clone git@github.com:amiyzku/nix-home-manager.git $OUT_DIR

if ! command -v "home-manager" &> /dev/null; then
  sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager
  sudo nix-channel --update
  nix-shell '<home-manager>' -A install
fi

