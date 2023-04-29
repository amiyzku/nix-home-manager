# How to setup
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon && \
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager && \
nix-channel --update && \
nix-shell '<home-manager>' -A install
git clone git@github.com:amiyzku/nix-home-manager.git ~/.config/home-manager/
home-manager switch
```

# Workflow
### edit
```bash
vim ~/.config/home-manager/home.nix
```

### apply
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
