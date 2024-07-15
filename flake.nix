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
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, darwin, nixpkgs, home-manager, nil, nixos-wsl, ... }@inputs:
  let
    nixpkgsConfig = {
      allowUnfree = true;
      allowUnsupportedSystem = false;
    };

    user = "pkrol";
    hm = home-manager.lib.hm;
    ghc-version = "982";
  in
  {
    darwinConfigurations.MacBook-Pro =
    let
      system = "aarch64-darwin";
      isWsl = false;
    in darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs nixpkgsConfig user system nil hm isWsl ghc-version; };
      modules = [
        home-manager.darwinModules.home-manager
        ./configuration/darwin
        ./packages/yabai
        ./home/darwin
      ];
    };

    nixosConfigurations.nixos =
    let
      system = "x86_64-linux";
      isWsl = true;
    in nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs nixpkgsConfig user system nil hm isWsl ghc-version; };
      modules = [
        nixos-wsl.nixosModules.default
        home-manager.nixosModules.home-manager
        ./configuration/nixos-wsl
        ./home/nixos-wsl
      ];
    };
  };
}
