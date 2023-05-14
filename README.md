# Home-manager

## How to setup

### non NixOS

```bash
./setup.sh
ln -snf $HOME/.nix-profile/bin/fish /usr/local/bin/fish
```

### NixOS

```bash
./setup-for-nixos.sh
ln -snf $HOME/.nix-profile/bin/fish /usr/local/bin/fish
```

## Edit

### non NixOS

```bash
vim ~/.config/home-manager/home.nix
```

### NixOS

```bash
vim ~/.config/nixpkgs/home.nix
```

## apply

```bash
home-manager switch
```

# Links

### Nix

[Nix Packages](https://search.nixos.org/packages "Nix package search")

[Nix Reference Manual](https://nixos.org/manual/nix/stable/introduction.html "Nix Reference Manual")

### Home Manager

[Home Manager Manual](https://nix-community.github.io/home-manager/index.html "Home Manager Manual")

[Home Manager Appendix A. Configuration Options](https://rycee.gitlab.io/home-manager/options.html "Home Manager Appendix A. Configuration Options")

### Others

[Nixを使うと何が嬉しいのか](https://scrapbox.io/mrsekut-p/Nix%E3%82%92%E4%BD%BF%E3%81%86%E3%81%A8%E4%BD%95%E3%81%8C%E5%AC%89%E3%81%97%E3%81%84%E3%81%AE%E3%81%8B "Nixを使うと何が嬉しいのか")

# Info

### How to search available options

1. nix repl
```bash

nix repl

```
