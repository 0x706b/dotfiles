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
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = { self, darwin, nixpkgs, home-manager, nil, ... }@inputs:
  let
    inherit (darwin.lib) darwinSystem;

    nixpkgsConfig = {
      allowUnfree = true;
      allowUnsupportedSystem = false;
    };

    user = "peter";
    system = "x86_64-darwin";
    hm = home-manager.lib.hm;
    ghc-version = "924";
  in
  {
    darwinConfigurations.Peters-MBP = darwinSystem {
      inherit system;
      specialArgs = { inherit inputs nixpkgsConfig user system nil hm ghc-version; };
      modules = [
        home-manager.darwinModules.home-manager
        ./configuration.nix
        ./home.nix
      ];
    };
  };
}
