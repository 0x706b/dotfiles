{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    tree-sitter
  ];
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    # waylandSupport = true;
    package = pkgs.neovim;
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/peter/dotfiles/home/modules/neovim/nvim;
  };
}
