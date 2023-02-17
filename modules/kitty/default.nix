{ pkgs, lib, config, isLinux, ... }:
{
  home.packages = lib.optionals isLinux (with pkgs; [
    kitty
  ]);

  home.file.".config/kitty".source = ./kitty-config;
}
