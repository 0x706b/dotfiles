{ pkgs, lib, ... }:
{
  services.polybar = {
    enable = true;
    script = "polybar -q -r top & polybar -q -r bottom &";
  };

  programs.rofi = {
    enable = true;
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = "Mod1";

      fonts = [ "PragmataPro Mono Liga" ];

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
      };

      gaps = {
        inner = 15;
      };

      startup = [
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
