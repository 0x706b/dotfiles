{ pkgs, lib, config, ... }:
{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim;
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink /Users/peter/dotfiles/packages/neovim/nvim;
  };
}
