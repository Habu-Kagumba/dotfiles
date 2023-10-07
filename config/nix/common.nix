{ config, pkgs, ... }:


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
    # Utils
    bat
    bottom
    coreutils
    eza
    fd
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
