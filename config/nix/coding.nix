{ config, pkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> { };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
  };

  programs.git = {
    enable = true;
    userName = "Habu-Kagumba";
    userEmail = "habukagumba@gmail.com";
    signing = {
      key = "3F9B01CBE4DB7973";
      signByDefault = true;
    };
    aliases = {
      master = "checkout master";
      develop = "checkout develop";
      unstage = "reset HEAD --";
      uncommit = "reset --soft HEAD~1";
      recommit = "commit --amend --no-edit";
      amend = "commit --amend";
      get = "pull origin $(git branch 2> /dev/null | rg -e '\* ' | sed 's/^..\(.*\)/\1/')";
      save = "!git add . && git commit --no-verify -m \"WIP: auto save at $(date '+%Y%m%d %H:%M:%S')\"";
      mine = "log --author='Habu-Kagumba'";
    };
    delta = {
      enable = true;
      options = {
        theme = "OneHalfDark";
      };
    };
    extraConfig = {
      github.user = "Habu-Kagumba";
      url."git@github.com:Habu-Kagumba/" = {
        insteadOf = [
          "me:"
          "https://github.com/Habu-Kagumba/"
        ];
      };
      init = {
        defaultBranch = "main";
      };
    };
    ignores = [
      ### OS generated files
      ".DS_Store"
      ".DS_Store?"
      "._*"
      "ehthumbs.db"
      "Thumbs.db"
      ".AppleDouble"
      ".LSOverride"
      ## Files that might appear in the root of a volume
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ## Directories potentially created on remote AFP share
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"
      ### Vim
      "*.swp"
    ];
  };
}
