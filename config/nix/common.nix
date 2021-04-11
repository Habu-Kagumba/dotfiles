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
    bzip2
    ccache
    coreutils
    gcc
    libtool
    libxslt
    libyaml
    openssl
    zlib

    # Utils
    bat
    bottom
    ctags
    exa
    fzf
    httpie
    hub
    jq
    mosh
    noti
    parallel
    readline
    reattach-to-user-namespace
    ripgrep
    rsync
    tmux
    tor
    tree
    wget
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
}
