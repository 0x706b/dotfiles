{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    tree-sitter
  ];
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    # waylandSupport = true;
    # package = pkgs.neovim;
  };
  xdg.configFile."nvim/init.vim".enable = lib.mkForce false;
  xdg.configFile."nvim/init.lua".enable = lib.mkForce false;
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/modules/neovim/nvim";
  };
}
