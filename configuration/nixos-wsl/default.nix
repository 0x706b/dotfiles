# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  config,
  lib,
  pkgs,
  user,
  inputs,
  ...
}:

let
  nodejs-24-overlay = import ../../overlays/nodejs-24.22.1.nix;
  nodejs-26-overlay = import ../../overlays/nodejs-26.12.1.nix;
in
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    socat
    gcc
    iproute2
  ];

  environment.variables.editor = "vim";

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    home = "/home/${user}";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHUqHpUK6HSXLqY5kPaoKTAg7znT6aw8lFC2LKfeJY26 peter@peterkrol.com"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    # inputs.neovim-nightly-overlay.overlays.default
    nodejs-24-overlay
    nodejs-26-overlay
    inputs.nix-vscode-extensions.overlays.default
    (self: super: {
      zjstatus = inputs.zjstatus.packages.${super.system}.default;
    })
    (self: super: {
      llama-cpp = inputs.llama-cpp.packages.${super.system}.default;
    })
    # (self: super: {
    #   zellij = super.zellij.overrideAttrs (oldAttrs: {
    #     src = pkgs.fetchFromGitHub {
    #       owner = "zellij-org";
    #       repo = "zellij";
    #       rev = "v0.42.2";
    #       hash = "sha256-O7BZlPSBWy+q349NYCUsw4Rb5X3xyl5Ar+a/uQPQhZY=";
    #     };
    #   });
    # })
  ];

  wsl.enable = true;
  wsl.defaultUser = user;
  wsl.docker-desktop.enable = false;
  wsl.extraBin = with pkgs; [
    # Binaries for Docker Desktop wsl-distro-proxy
    { src = "${coreutils}/bin/mkdir"; }
    { src = "${coreutils}/bin/cat"; }
    { src = "${coreutils}/bin/whoami"; }
    { src = "${coreutils}/bin/ls"; }
    { src = "${busybox}/bin/addgroup"; }
    { src = "${su}/bin/groupadd"; }
    { src = "${su}/bin/usermod"; }
  ];
  wsl.wslConf.automount.root = "/mnt";
  wsl.wslConf.interop.appendWindowsPath = true;
  wsl.wslConf.network.generateHosts = false;

  services.openssh = {
    enable = true;
    openFirewall = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  systemd.services.docker-desktop-proxy.script = lib.mkForce ''${config.wsl.wslConf.automount.root}/wsl/docker-desktop/docker-desktop-user-distro proxy --docker-desktop-root ${config.wsl.wslConf.automount.root}/wsl/docker-desktop "C:\Program Files\Docker\Docker\resources"'';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
