{ pkgs, config, ... }:
{
  home.file.".vscode/data/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/peter/dotfiles/home/modules/vscode/settings.json;
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    mutableExtensionsDir = true;
    extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
      openai.chatgpt
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-containers
      ms-azuretools.vscode-docker
      dbaeumer.vscode-eslint
      rohit-gohri.format-code-action
      eamodio.gitlens
      ms-vsliveshare.vsliveshare
      vscodevim.vim
      viktorparaj.vague-theme
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      wallabyjs.quokka-vscode
      vitest.explorer
      bbenoist.nix
      qufiwefefwoyn.kanagawa
    ];
  };
}
