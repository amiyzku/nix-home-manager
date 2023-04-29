#!/usr/bin/env bash

set -eu

sh <(curl -L https://nixos.org/nix/install) --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
git clone git@github.com:amiyzku/nix-home-manager.git ~/.config/home-manager/
home-manager switch

