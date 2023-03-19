{ pkgs, ... }:
{
  environment.pathsToLink = [ "/libexec" ];
  # Configure the X11 windowing system.
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
        lxappearance
      ];
    };
    displayManager.defaultSession = "xfce";
  };
}
