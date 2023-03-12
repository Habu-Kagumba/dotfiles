{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      bass ". $HOME/.nix-profile/etc/profile.d/nix.sh" &&
      fish_vi_key_bindings &&
      source /usr/local/opt/asdf/libexec/asdf.fish &&
    '';
    shellAliases = {
      # Terminal
      ls = "exa -l";
      cat = "bat";
      # Hardware
      wifi-off = "networksetup -setairportpower en0 off";
      wifi-on = "networksetup -setairportpower en0 on";
      # Network
      ip = "dig +short myip.opendns.com @resolver1.opendns.com";
      localip = "ipconfig getifaddr en0";
      ips = "ifconfig -a | rg -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'";
      # Git
      lg = "lazygit";
      # Dev
      dotfiles = "cd $HOME/dotfiles";
      jscode = "cd $HOME/Dev/JS-code";
      rbcode = "cd $HOME/Dev/Ruby-code";
      pycode = "cd $HOME/Dev/Python-code";
      gocode = "cd $HOME/Dev/Go-code";
      opscode = "cd $HOME/Dev/DevOps-code";
      sqlcode = "cd $HOME/Dev/SQL-code";
      docscode = "cd $HOME/Dev/Docs-code";
      haskellcode = "cd $HOME/Dev/Haskell-code";
      rcode = "cd $HOME/Dev/R-code";
      rustcode = "cd $HOME/Dev/Rust-code";
      ioscode = "cd $HOME/Dev/iOS-code";
      cryptocode = "cd $HOME/Dev/Crypto-code";
      fluttercode = "cd $HOME/Dev/Flutter-code";
      ccode = "cd $HOME/Dev/C-Code";
      c3d = "cd $HOME/Dev/3D";
      openscadcode = "cd $HOME/Dev/Openscad-code";
      elixircode = "cd $HOME/Dev/Elixir-code";
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
      geminit = "gem list --no-versions | xargs -n1 gem uninstall -aI";
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
    settings = {
      gcloud.disabled = false;
    };
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
      set-option -g default-shell bash
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
          set -g status-right "#[fg=colour247,bg=colour236] CPU: #{cpu_percentage} RAM: #{ram_percentage} ⦙ %A, %h %d %Y ⦙ %l:%M %p #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]"
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
          family = "FiraCode Nerd Font";
          style = "Retina";
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
        primary = {
          background = "0x282a36";
          foreground = "0xf8f8f2";
        };
        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };
        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };
        search = {
          matches = {
            foreground = "0x44475a";
            background = "0x50fa7b";
          };
        };
        focused_match = {
          foreground = "0x44475a";
          background = "0xffb86c";
        };
        bar = {
          background = "0x282a36";
          foreground = "0xf8f8f2";
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        selection = {
          text = "CellForeground";
          background = "0x44475a";
        };
        normal = {
          black =   "0x000000";
          red =     "0xff5555";
          green =   "0x50fa7b";
          yellow =  "0xf1fa8c";
          blue =    "0xbd93f9";
          magenta = "0xff79c6";
          cyan =    "0x8be9fd";
          white =   "0xbfbfbf";
        };
        bright = {
          black =   "0x4d4d4d";
          red =     "0xff6e67";
          green =   "0x5af78e";
          yellow =  "0xf4f99d";
          blue =    "0xcaa9fa";
          magenta = "0xff92d0";
          cyan =    "0x9aedfe";
          white =   "0xe6e6e6";
        };
        dim = {
          black =   "0x14151b";
          red =     "0xff2222";
          green =   "0x1ef956";
          yellow =  "0xebf85b";
          blue =    "0x4d5b86";
          magenta = "0xff46b0";
          cyan =    "0x59dffc";
          white =   "0xe6e6d1";
        };
      };
    };
  };
}
