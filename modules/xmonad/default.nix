{ pkgs, lib, ... }:
{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./Config.hs;
    extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      haskellPackages.xmonad
    ];
  };
}
