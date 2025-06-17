{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ wezterm ];
  xdg.configFile."wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink /Users/pkrol/dotfiles/packages/wezterm/wezterm.lua;
}
