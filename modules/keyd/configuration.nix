{ pkgs, lib, ... }:
{
  systemd.services.keyd = {
    enable = true;
    description = "keyd key remapping daemon";
    unitConfig = {
      Requires = "local-fs.target";
      After = "local-fs.target";
    };
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.keyd}/bin/keyd";
    };
  };
  environment.etc."keyd/default.conf".text = ''
    [ids]

    *

    [main]

    capslock = overload(capslock_layer, esc)

    [capslock_layer]

    h = left
    j = down
    k = up
    l = right
  '';
}
