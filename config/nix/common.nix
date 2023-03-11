{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NIX_PATH = "$HOME/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/herbertkagumba/channels/nixpkgs:/nix/var/nix/profiles/per-user/herbertkagumba/channels";
    EDITOR = "$HOME/.nix-profile/bin/vim";
    GOBIN = "$HOME/go/bin";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = with pkgs; [
    # Utils
    bat
    bottom
    exa
    fd
    fzf
    gdu
    gh
    gnupg
    httpie
    lazygit
    ngrok
    noti
    parallel
    pre-commit
    ripgrep
    rsync
    tor
    tree
    watch
    wget

    # Languages
    python3Full

    # Nix
    niv
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
}
