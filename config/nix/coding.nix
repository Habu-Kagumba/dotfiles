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

  home.packages = with pkgs; [
    # Languages
    go
    nodejs-12_x
    pythonFull
    python3Full
    ruby
    yarn
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
      url."git@personal.github.com:Habu-Kagumba/" = {
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
    extraConfig = builtins.readFile ../neovim/init.vim;
    plugins = with pkgs.vimPlugins; [
      # Colorschemes
      onedark-vim
      onehalf
      vim-one
      # Essentials
      auto-pairs
      DidYouMean
      fzf-vim
      fzfWrapper
      lightline-vim
      surround
      tagbar
      vim-buftabline
      vim-commentary
      vim-devicons
      vim-fugitive
      vim-mkdir
      vim-repeat
      vim-rhubarb
      vim-surround
      # Language Support
      coc.nvim
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
      coc.nvim
      emmet-vim
      vim-go
      vim-javascript
      vim-nix
      vim-rake
      vim-ruby
      yats.vim
    ];
  };
}
