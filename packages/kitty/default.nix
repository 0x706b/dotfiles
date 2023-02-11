{ pkgs, lib, config, ... }:
{
  home.file.".config/kitty".source = ./kitty-config;
}
