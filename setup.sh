#!/usr/bin/env bash

set -eu

# Install nix.
sh <(curl -L https://nixos.org/nix/install) --daemon

# Apply nix && run command.
exec bash -lc "
set -eu

# Add home-manageri to channel.
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# Place repo before installing home-manager.
git clone git@github.com:amiyzku/nix-home-manager.git ~/.config/home-manager/

# Install home-manager.
nix-shell '<home-manager>' -A install

# apply ~/.config/home-manager/home.nix
home-manager switch
"
