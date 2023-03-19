{ pkgs, lib, ... }:
{
  services.xserver.windowManager = {
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
