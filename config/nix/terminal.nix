{ config, pkgs, ... }:

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
      brewup = "brew update; brew upgrade; brew cleanup; brew doctor";
      # Docker
      dc = "docker-compose";
      dcb = "docker-compose up --build";
      dclean = "docker stop (docker ps -a -q) ; docker rm -f (docker ps -a -q) ; docker rmi -f (docker images -a -q) ; docker volume rm -f (docker volume ls -q)";
      dprune = "docker container prune -f ; docker image prune -f ; docker network prune -f ; docker volume prune -f";
      # Bundle
      b = "bundle";
      bx = "bundle exec";
      bip = "bundle install";
      bu = "bundle update";
      # TMUX
      tm = "tmux new-session -s (basename $PWD)";
      tma = "tmux attach-session -t (basename $PWD)";
      tmd = "tmux detach";
      tml = "tmux ls";
      tmk = "tmux kill-session";
    };
    functions = {
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
      set-option -g default-shell $SHELL
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
      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window
      # Synchronize
      bind-key s set-window-option synchronize-panes\; display-message "synchronize-panes is now #{?pane_synchronized,on,off}"
      ###################
      ### Status Line ###
      ###################
      set -g window-status-separator ""
      set -g status-left "#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour236,nobold,nounderscore,noitalics]"
      setw -g window-status-format "#[fg=colour244,bg=colour236] #I ⦙#[fg=colour250,bg=colour236] #W "
      setw -g window-status-current-format "#[fg=colour236,bg=colour60,nobold,nounderscore,noitalics] #[fg=colour231,bg=colour60] #I ⦙#[fg=colour231,bg=colour60,bold] #W #[fg=colour60,bg=colour236,nobold,nounderscore,noitalics]"

      # General status bar settings
      set -g status og
      set -g status-interval 5
      set -g status-position bottom
      set -g status-justify left
      set -g status-right-length 120
      set -g status-left-length 120
      set -g status-bg colour000
      set -g status-fg colour007
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
        plugin = tmuxPlugins.cpu;
        extraConfig = ''
          set -g status-right "#[fg=colour247,bg=colour236] CPU: #{cpu_percentage} RAM: #{ram_percentage}  BAT: #{battery_percentage} ⦙ %A, %h %d %Y ⦙ %l:%M %p #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]"
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
        dynamic_title = true;
      };
      draw_bold_text_with_bright_colors = true;
      font = {
        normal = {
          family = "Fira Code";
          style = "Retina";
        };
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        italic = {
          family = "Fantasque Sans Mono";
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
