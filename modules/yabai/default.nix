{ pkgs, lib, config, ... }:
{
  home.file.".yabairc".source = ./.yabairc;
  home.file.".skhdrc".source = ./.skhdrc;
}
