#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -eu

if [[ $(uname -a | grep -i nixos) == 1 ]]; then
  echo "Error: This script is for NixOS"
  exit 1
fi

if ! command -v "home-manager" &> /dev/null; then
  echo "Error: Not found home-manager package"
  echo ''
  echo 'Try editing as follows:
vim /etc/nixos/configuration.nix
```
users.users.<name> = {
  packages = with pkgs; [
    home-manager
  ];
};
```
  '
  exit 1
fi

OUT_DIR=$HOME/.config/nixpkgs
mkdir -p $OUT_DIR
git clone git@github.com:amiyzku/nix-home-manager.git $OUT_DIR

