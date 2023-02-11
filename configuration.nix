{ config, pkgs, user, nixpkgsConfig, inputs, ... }:

{
  environment.systemPackages =
    [ pkgs.vim
    ];

  environment.darwinConfig = "$HOME/dotfiles/flake.nix";

  services = {
    nix-daemon.enable = true;
  };

  nixpkgs.config = nixpkgsConfig;
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  users.users.${user} = {
    home = "/Users/${user}";
    # shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };
    brews = [
      "fzf"
      "archey4"
      {
        name = "koekeishiya/formulae/skhd";
        start_service = true;
        restart_service = true;
      }
      {
        name = "koekeishiya/formulae/yabai";
        start_service = true;
        restart_service = true;
      }
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/core"
      "homebrew/cask"
      "homebrew/services"
      "koekeishiya/formulae"
    ];
    casks = [
      "discord"
      "docker"
      "firefox"
      "google-chrome"
      "karabiner-elements"
      "kitty"
      "spotify"
      "visual-studio-code"
      "1password"
    ];
  };

  nix = {
    package = pkgs.nixFlakes;
    settings = {
      allowed-users = [ user ];
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system.stateVersion = 4;

  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.15;
      };
      NSGlobalDomain = {
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        ApplePressAndHoldEnabled = false;
      };
    };
  };

  system.activationScripts.applications.text = pkgs.lib.mkForce (
    ''
      echo "setting up ~/Applications..." >&2
      rm -rf ~/Applications/Nix\ Apps
      mkdir -p ~/Applications/Nix\ Apps
      for app in $(find ${config.system.build.applications}/Applications -maxdepth 1 -type l); do
        src="$(/usr/bin/stat -f%Y "$app")"
        cp -r "$src" ~/Applications/Nix\ Apps
      done
    ''
  );

  documentation = {
    enable = false;
    doc.enable = false;
  };
}
