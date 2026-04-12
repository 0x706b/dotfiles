{
  config,
  pkgs,
  user,
  inputs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.vim
  ];

  environment.darwinConfig = "$HOME/dotfiles/flake.nix";

  services = {
    nix-daemon.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = false;
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlays.default
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
      "lua-language-server"
      # "koekeishiya/formulae/skhd"
      # "koekeishiya/formulae/yabai"
      "k9s"
      "jq"
      "lima"
      "kubernetes-cli"
      "tilt-dev/tap/tilt"
      "k3d"
      "adr-tools"
      "graphviz"
      "mvn"
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/services"
      # "koekeishiya/formulae"
      "tilt-dev/tap"
    ];
    casks = [
      "discord"
      "docker"
      "firefox"
      # "google-chrome"
      "karabiner-elements"
      "kitty"
      "spotify"
      "visual-studio-code"
      "amethyst"
      "cameracontroller"
    ];
  };

  nix = {
    package = pkgs.nixVersions.stable;
    settings = {
      allowed-users = [ user ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  system.stateVersion = 4;

  system = {
    defaults = {
      dock = {
        autohide = false;
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

  system.activationScripts.applications.text = pkgs.lib.mkForce (''
    echo "setting up ~/Applications..." >&2
    rm -rf ~/Applications/Nix\ Apps
    mkdir -p ~/Applications/Nix\ Apps
    for app in $(find ${config.system.build.applications}/Applications -maxdepth 1 -type l); do
      src="$(/usr/bin/stat -f%Y "$app")"
      cp -r "$src" ~/Applications/Nix\ Apps
    done
  '');

  documentation = {
    enable = false;
    doc.enable = false;
  };
}
