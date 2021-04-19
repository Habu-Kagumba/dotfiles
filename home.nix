{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    config/nix/common.nix
    config/nix/coding.nix
    config/nix/terminal.nix
  ];

  programs.home-manager.enable = true;

  home.username = "herbertkagumba";
  home.homeDirectory = "/Users/herbertkagumba";

  home.stateVersion = "21.05";
}
