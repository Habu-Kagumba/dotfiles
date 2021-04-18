{ config, pkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.git = {
    enable = true;
    userName = "Habu-Kagumba";
    userEmail = "habukagumba@gmail.com";
    signing = {
      key = "E1024A1F021639F9";
      signByDefault = true;
    };
    aliases = {
      master = "checkout master";
      develop = "checkout develop";
      unstage = "reset HEAD --";
      uncommit = "reset --soft HEAD~1";
      recommit = "commit --amend --no-edit";
      amend = "commit --amend";
      get = "pull origin master";
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
      ### Nix
      "default.nix"
      "shell.nix"
      ### Direnv
      ".envrc"
    ];
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      pkgsUnstable.fzf
    ];
    extraConfig = builtins.readFile /Users/herbertkagumba/dotfiles/config/neovim/init.vim;
    plugins = with pkgs.vimPlugins; [
      # Colorschemes
      dracula
      # Essentials
      auto-pairs
      fzf-vim
      fzfWrapper
      lightline-vim
      surround
      tagbar
      commentary
      vim-devicons
      fugitive
      vim-automkdir
      repeat
      rhubarb
      # Language Support
      coc-nvim
      coc-css
      coc-eslint
      coc-highlight
      coc-html
      coc-json
      coc-lists
      coc-prettier
      coc-rls
      coc-snippets
      coc-solargraph
      coc-stylelint
      coc-tsserver
      emmet-vim
      syntastic
      vim-go
      vim-javascript
      vim-nix
      vim-ruby
      vim-snippets
      yats-vim
    ];
  };
}
