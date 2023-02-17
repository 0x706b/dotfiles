{
  description = "0x706b Home Manager Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote.url = "github:nix-community/lanzaboote";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = { self, darwin, nixpkgs, home-manager, nil, lanzaboote, ... }@attrs:
  let
    inherit (darwin.lib) darwinSystem;
    inherit (nixpkgs.lib) nixosSystem;

    nixpkgsConfig = {
      allowUnfree = true;
      allowUnsupportedSystem = false;
    };
    user = "peter";
    hm = home-manager.lib.hm;
    ghc-version = "924";
  in
  {
    darwinConfigurations.Peters-MBP = darwinSystem {
      specialArgs = {
        inherit attrs nixpkgsConfig user nil hm;
        isDarwin = true;
        isLinux  = false;
        system   = "x86_64-darwin";
      };
      modules = [
        home-manager.darwinModules.home-manager
        ./darwin/configuration.nix
        ./home.nix
      ];
    };

    nixosConfigurations.nixos = nixosSystem {
      specialArgs = {
        inherit attrs user nil hm;
        isDarwin = false;
        isLinux  = true;
        system   = "x86_64-linux";
      };

      modules = [
      	home-manager.nixosModule
        ./nixos/configuration.nix
        ./home.nix
        lanzaboote.nixosModules.lanzaboote
        ({ config, pkgs, lib, ... }: {
          boot.bootspec.enable = true;

          environment.systemPackages = [
            pkgs.sbctl
          ];

          boot.loader.systemd-boot.enable = lib.mkForce false;

          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/etc/secureboot";
          };
        })
      ];
    };
  };
}
