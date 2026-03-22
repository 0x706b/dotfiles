{
  description = "0x706b Home Manager Flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };

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

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.54.2-b";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix/f8dad87c2cb956695d18c1f36360322d8a0b7d63";
  };

  outputs = { self, darwin, nixpkgs, home-manager, nil, nixos-wsl, stylix, ... }@inputs:
  let
    user = "peter";
    hm = home-manager.lib.hm;
    ghc-version = "912";
  in
  {
    darwinConfigurations.MacBook-Pro =
    let
      system = "aarch64-darwin";
      isWsl = false;
    in darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs user nil isWsl; };
      modules = [
        home-manager.darwinModules.home-manager
        ./configuration/darwin
        ./home/darwin
      ];
    };

    nixosConfigurations.nixos =
    let
      isWsl = false;
    in nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs user isWsl ghc-version; };
      modules = [
        ./configuration/nixos/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        ./home
      ];
    };

    nixosConfigurations.nixos-wsl =
    let
      system = "x86_64-linux";
      isWsl = true;
    in nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs user system nil hm isWsl ghc-version stylix; };
      modules = [
        nixos-wsl.nixosModules.default
        home-manager.nixosModules.home-manager
        ./configuration/nixos-wsl
        ./home
      ];
    };
  };
}
