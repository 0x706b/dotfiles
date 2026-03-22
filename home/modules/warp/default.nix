{ config, ... }:
{
  home.file.".warp" = {
    source = config.lib.file.mkOutOfStoreSymlink /Users/pkrol/dotfiles/packages/warp/.warp;
  };
}
