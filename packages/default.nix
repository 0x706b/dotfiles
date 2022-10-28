{ config, pkgs, lib, inputs, ... }: {
  nixpkgs.overlays = [
    (import ./starship.nix inputs)
  ];
}
