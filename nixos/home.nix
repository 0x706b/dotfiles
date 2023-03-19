{ pkgs, ... }:
{
  imports =
    [ ../modules/i3 ];
  home.packages = with pkgs; [
    chromium
  ];
}
