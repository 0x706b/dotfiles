{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    package = pkgs.neovim;
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink /Users/pkrol/dotfiles/packages/neovim/nvim;
  };
}
