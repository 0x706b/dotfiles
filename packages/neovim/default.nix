{ pkgs, lib, config, ... }:
{
  programs.neovim = {
    enable = true;
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink /Users/peter/dotfiles/packages/neovim/nvim;
  };
}
