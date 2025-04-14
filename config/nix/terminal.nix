{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish &&
      fish_vi_key_bindings
    '';
    shellAliases = {
      # Terminal
      ls = "eza -l";
      cat = "bat";
      find = "fd";
      du = "dust";
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
      androidcode = "cd $HOME/Dev/Android-code";
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
      luacode = "cd $HOME/Dev/Lua-code";
      projects = "cd $HOME/Dev/Projects";
      # Brew
      brewup = "brew update; brew upgrade; brew cleanup; brew doctor";
      # Docker
      dc = "docker compose";
      dcb = "docker compose up --build";
      dclean = "docker stop (docker ps -a -q) ; docker rm -f (docker ps -a -q) ; docker rmi -f (docker images -a -q) ; docker volume rm -f (docker volume ls -q)";
      dprune = "docker container prune -f ; docker image prune -f ; docker network prune -f ; docker volume prune -f";
      # Bundle & Rails
      b = "bundle";
      bx = "bundle exec";
      bip = "bundle install";
      bu = "bundle update";
      # Zellij
      zj = "zellij";
      # Tailscale
      tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
    };
    functions = {
      gi = "curl -sL https://www.gitignore.io/api/$argv";
      geminit = "gem list --no-versions | xargs -n1 gem uninstall -aI";
    };
    plugins = [];
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      gcloud.disabled = false;
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      default_shell = "fish";
      theme = "catppuccin-mocha";
      copy_command = "pbcopy";
      keybinds = {
        unbind = "Ctrl h";
      };
    };
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
        decorations = "Buttonless";
        dynamic_title = true;
        option_as_alt = "Both";
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Light";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Regular";
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
      };
      terminal.shell.program = "fish";
      colors = {
        draw_bold_text_with_bright_colors = true;
        primary = {
          background = "0x282433";
          foreground = "0xeee9fc";
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
          focused_match = {
            foreground = "0x44475a";
            background = "0xffb86c";
          };
        };
        footer_bar = {
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
          black = "0x282433";
          red = "0xe965a5";
          green = "0xb1f2a7";
          yellow = "0xebde76";
          blue = "0xb1baf4";
          magenta = "0xe192ef";
          cyan = "0xb3f4f3";
          white ="0xeee9fc";
        };
        bright = {
          black = "0x4d4d4d";
          red = "0xff6e67";
          green = "0x5af78e";
          yellow = "0xf4f99d";
          blue = "0xcaa9fa";
          magenta = "0xff92d0";
          cyan = "0x9aedfe";
          white = "0xe6e6e6";
        };
        dim = {
          black = "0x3f3951";
          red = "0xe965a5";
          green = "0xb1f2a7";
          yellow = "0xebde76";
          blue = "0xb1baf4";
          magenta = "0xe192ef";
          cyan = "0xb3f4f3";
          white = "0xeee9fc";
        };
      };
    };
  };
}
