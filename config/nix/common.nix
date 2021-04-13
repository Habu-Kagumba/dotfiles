{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NIX_PATH = "$HOME/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/herbertkagumba/channels/nixpkgs:/nix/var/nix/profiles/per-user/herbertkagumba/channels";
    GOPATH = "$HOME/Dev/Go-code";
    PATH = "$HOME/bin:$GOPATH/bin:$HOME/.nix-profile/bin";
  };

  home.packages = with pkgs; [
    # Core
    autoconf
    automake
    coreutils
    gcc
    openssl

    # Utils
    bat
    bottom
    exa
    fzf
    gh
    httpie
    jq
    mosh
    noti
    parallel
    readline
    ripgrep
    rsync
    tmux
    tor
    tree
    watch
    wget

    # Languages
    go
    nodejs
    pythonFull
    python3Full
    pkgsUnstable.ruby_3_0
    yarn
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
}
