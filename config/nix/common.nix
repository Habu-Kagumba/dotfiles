{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NIX_PATH = "$HOME/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/herbertkagumba/channels/nixpkgs:/nix/var/nix/profiles/per-user/herbertkagumba/channels";
    EDITOR = "$HOME/.nix-profile/bin/vim";
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
    gnupg
    httpie
    jq
    mosh
    ngrok
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
    python3Full
    pkgsUnstable.ruby_3_0
    solargraph
    yarn

    # Nix
    niv
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
}
