{ config, pkgs, ... };

{
  programs.fish = {
    enable = true;
    promptInit = ''
      bass ". $HOME/.nix-profile/etc/profile.d/nix.sh"
    '';
    shellAliases = {
      # Dev
      dotfiles = "cd $HOME/dotfiles";
      jscode = "cd $HOME/Dev/JS-code";
      rbcode = "cd $HOME/Dev/Ruby-code";
      pycode = "cd $HOME/Dev/Python-code";
      gocode = "cd $GOPATH/code";
      opscode = "cd $HOME/Dev/DevOps-code";
      sqlcode = "cd $HOME/Dev/SQL-code";
      docscode = "cd $HOME/Dev/Docs-code";
      haskellcode = "cd $HOME/Dev/Haskell-code";
      rcode = "cd $HOME/Dev/R-Code";
      rustcode = "cd $HOME/Dev/Rust-Code";
      # Brew
      brewup = "brew update; brew upgrade; brew prune; brew cleanup; brew doctor";
      # Docker
      dc = "docker-compose";
      dcb = "docker-compose up --build";
      dclean = "docker stop $(docker ps -a -q) ; docker rm -f $(docker ps -a -q) ; docker rmi -f $(docker images -a -q) ; docker volume rm -f $(docker volume ls -q)";
      dprune = "docker container prune -f ; docker image prune -f ; docker network prune -f ; docker volume prune -f";
      # Bundle
      b = "bundle";
      bx = "bundle exec";
      bip = "bundle install";
      bu = "bundle update";
      # TMUX
      tm = "tmux new-session -s $(basename $PWD)";
      tma = "tmux attach-session -t $(basename $PWD)";
      tmd = "tmux detach";
      tml = "tmux ls";
      tmk = "tmux kill-session";
    };
    functions = {
      git = "hub $argv";
      gi = "curl -sL https://www.gitignore.io/api/$argv";
    };
    plugins = [
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "7aae6a85c24660422ea3f3f4629bb4a8d30df3ba";
          sha256 = "03693ywczzr46dgpnbawcfv02v5l143dqlz1fzjbhpwwc2xpr42y";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    newSession = true;
    sensibleOnTop = true;
    shortcut = "a";
    terminal = "xterm-256color";
    extraConfig = ''
      ###############
      ### General ###
      ###############
      set-option -g default-shell $HOME/.nix-profile/bin/fish
      # Enable mouse support
      set-option -g mouse on
      # Add terminal overrides for better TrueColor support
      set -as terminal-overrides ",xterm-256color*:Tc"
      ### Performance settings
      set -g focus-events off
      set -g escape-time 0
      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
      tmuxPlugins.yank
      tmuxPlugins.open
      tmuxPlugins.pain-control
      {
        plugin = tmuxPlugins.prefix-highlight;
        extraConfig = ''
          # Configure plugin: 'tmux-prefix-highlight'
          set -g @prefix_highlight_output_prefix ' ﬿ '
          set -g @prefix_highlight_output_suffix ' '
          set -g @prefix_highlight_prefix_prompt 'Prfx'
          set -g @prefix_highlight_fg 'colour000'
          set -g @prefix_highlight_bg 'colour005'
          set -g @prefix_highlight_show_copy_mode 'on'
          set -g @prefix_highlight_copy_mode_prompt 'Copy'
          set -g @prefix_highlight_copy_mode_attr 'fg=colour000,bg=colour03'
          set -g @prefix_highlight_empty_prompt 'Tmux'
          set -g @prefix_highlight_empty_has_affixes 'on'
          set -g @prefix_highlight_empty_attr 'fg=colour000,bg=colour012'
          ###################
          ### Status Line ###
          ###################
          ### Windows line configuration 1
          # window segments in status line
          # set -g window-status-separator "  〉"
          set -g window-status-separator " "
          set-window-option -g window-status-current-format '#[fg=colour008,bg=colour000,noitalics]#[fg=colour010,bg=colour008]#I#[fg=colour008,bg=colour010,noitalics]#[fg=colour008,bg=colour010]▌#[fg=colour000,bg=colour010]#W#[fg=colour010,bg=colour000,noitalics]'
          set-window-option -g window-status-format "#[fg=colour007] #I #W "
          set-window-option -g window-status-current-style bg=colour010,fg=colour000
          # general status bar settings
          set -g status on
          set -g status-interval 5
          set -g status-position top
          set -g status-justify left
          set -g status-right-length 120
          set -g status-bg colour000
          set -g status-fg colour007
          # Widgets
          wg_is_zoomed="#[fg=$color_dark,bg=$color_secondary]#{?window_zoomed_flag,[Z],}#[default]"
          set -g status-left "#{prefix_highlight} $wg_is_zoomed $wg_session"
          set -g status-right "#(pyline --tmux cpu mem host time bat)#[default]"
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          # Tmux sessions and (Neo)Vim sessions integration
          # See: https://github.com/tmux-plugins/tmux-resurrect/blob/master/docs/restoring_vim_and_neovim_sessions.md
          # for vim
          set -g @resurrect-strategy-vim 'session'
          # for neovim
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
    ];
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "none";
        dynamic_title = true;
      };
      draw_bold_text_with_bright_colors = true;
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          #style = "Retina";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FantasqueSansMono Nerd Font";
          style = "Italic";
        };
        size = 12.0;
        glyph_offset = {
          x = 0;
          y = 0;
        };
        scale_with_dpi = true;
        use_thin_strokes = true;
      };
      shell.program = "fish";
      colors = {
        # Default colors
        primary = {
          background = "0x282c34";
          foreground = "0xabb2bf";
        };
        # Normal colors
        normal = {
          black =   "0x282c34";
          red =     "0xe06c75";
          green =   "0x98c379";
          yellow =  "0xd19a66";
          blue =    "0x61afef";
          magenta = "0xc678dd";
          cyan =    "0x56b6c2";
          white =   "0xabb2bf";
        };
        # Bright colors
        bright = {
          black =   "0x5c6370";
          red =     "0xe06c75";
          green =   "0x98c379";
          yellow =  "0xd19a66";
          blue =    "0x61afef";
          magenta = "0xc678dd";
          cyan =    "0x56b6c2";
          white =   "0xffffff";
        };
      };
    };
  };
}
