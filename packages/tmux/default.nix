{ pkgs, lib, config, ... }:
{
  programs.tmux = {
    enable = true;
    secureSocket = false;
  };
  home.file.".tmux.conf".source = ./tmux.conf;
}
