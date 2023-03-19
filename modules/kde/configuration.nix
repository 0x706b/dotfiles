{ pkgs, libs, ... }:
{
  services.xserver.displayManager = {
    sddm.enable = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;
  environment.systemPackages = with pkgs; [ libsForQt5.qtstyleplugin-kvantum libsForQt5.bismuth ];
}
