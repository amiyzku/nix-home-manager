#!/usr/bin/env bash

set -eu

git clone git@github.com:amiyzku/nix-home-manager.git ~/.config/home-manager/

# install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# apply nix && run command
exec bash -lc "
set -eu

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# apply ~/.config/home-manager/home.nix
home-manager switch
"
