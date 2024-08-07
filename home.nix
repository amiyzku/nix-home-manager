{ config, pkgs, ... }:

let
  pkgsUnstable = import <nixpkgs> {};
in

{
  # ユーザ名
  home.username = builtins.getEnv "USER";

  # ホームディレクトリ
  home.homeDirectory = builtins.getEnv "HOME";

  # 設定オプションの互換性を維持するためのバージョン。破損を防ぐのに役立つ。
  # このバージョンを変更せずに、以下でインストールしているバージョンを更新できる。
  home.stateVersion = "22.11";

  # 設定なしでインストールすれば良いだけのパッケージはここに記述
  # 現在のユーザに対してインストールされる
  # システム全体にインストールする場合は /etc/nix/nix.conf に記載する
  home.packages = with pkgsUnstable; [
    fish
    htop
    bat
    git
    lsd
    delta
    zellij
    chezmoi
    fzf
    zoxide
    rustup
    neovim
    nnn
    ripgrep
    onefetch
    gping
    procs
    bottom
    jq
    libuchardet
    fd
    just
    gh
    ghq
    direnv
    irust
    dust
  ] ++ (
    if builtins.currentSystem == "aarch64-linux" then [
    unzip
  ] else if builtins.currentSystem == "aarch64-darwin" then [
    alacritty
    alt-tab-macos
    postman
  ] else [
    
  ]);

  # ホームディレクトリ配下にファイルを配置する
  # 一般的なユースケースはdotfilesを配置
  # ```例
  # home.file = {
  #   ".vimrc".source = ./.vimrc;
  #   ".bashrc".source = ./.bashrc;
  # }
  # ```
  home.file = {
  };

  # 環境変数
  home.sessionVariables = {
  };

  # 設定ありでインストールするパッケージは`programs.<パッケージ名>`として設定
  # programs空間で利用可能なパッケージ：https://github.com/nix-community/home-manager/tree/master/modules/programs
  programs.home-manager.enable = true;
}


# ++++++++++++++++++++++++++++++++++++++++++++++
# Memo
# ++++++++++++++++++++++++++++++++++++++++++++++
# ユーザマニュアル：https://nix-community.github.io/home-manager/
#
# 設定可能な値：https://nix-community.github.io/home-manager/options.html
#
# [パッケージのバージョンを指定する]
# 1.https://lazamar.co.uk/nix-versions/ で特定バージョンを探す
# 2.以下のようなコードを{}スコープ外に記述
# let
#    fishPkg = import (builtins.fetchTarball {
#        url = "https://github.com/NixOS/nixpkgs/archive/34bfa9403e42eece93d1a3740e9d8a02fceafbca.tar.gz";
#    }) {};
# in
# 3.作成したパッケージを指定する
# programs.fish = {
#   ...
#   package = fishPkg.fish;
#   ...
# }
#
# [programsでインストールと設定を行う方法]
# programs.git = {
#   enable = true;
#   userName = "Your Name";
#   userEmail = "email@example.com";
# };
