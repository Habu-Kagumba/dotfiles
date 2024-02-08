{ config, pkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> { };
in
{
  home.sessionVariables = {
    EDITOR = "$HOME/.nix-profile/bin/vim";
    GOBIN = "$HOME/go/bin";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Util  ];
    # Utils
    asdf-vm
    bandwhich
    bat
    bottom
    coreutils
    du-dust
    eza
    fd
    gdu
    gh
    gnupg
    gnused
    (writeShellScriptBin "gsed" "exec ${gnused}/bin/sed \"$@\"")
    httpie
    hyperfine
    lazygit
    ngrok
    noti
    parallel
    pre-commit
    ripgrep
    rsync
    tokei
    tree
    watch
    wget

    # Languages
    python3Full
    pyright

    # Nix
    niv
  ];

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = [ "--preview 'bat -n --color=always {}'" ];
  };

  programs.direnv = {
    enable = true;
  };
}
