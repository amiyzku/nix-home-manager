#!/usr/bin/env bash

set -eu

git clone git@github.com:amiyzku/nix-home-manager.git ~/.config/home-manager/
sh <(curl -L https://nixos.org/nix/install) --daemon
exec $(/usr/bin/env bash) -l
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
home-manager switch

