{ config, ... }:
{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim;
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/peter/dotfiles/packages/neovim/nvim;
  };
}
