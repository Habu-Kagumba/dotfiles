{ config, pkgs, ... }:

{
  imports = [
    config/nix/common.nix
    config/nix/coding.nix
    config/nix/terminal.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = "...";
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "herbertkagumba";
  home.homeDirectory = "/Users/herbertkagumba";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
