{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "monotone-vscode-theme";
        publisher = "0x706b-extensions";
        version = "0.0.3";
        sha256 = "sha256-xsXgBGFO0nLm42/XpesY+qoMFJndZiYqSW+Bl8c1QHQ=";
      }
      {
        name = "vscode-tsserver-debug";
        publisher = "andrewbranch";
        version = "1.3.0";
        sha256 = "sha256-JNZoxY1PBglvrXYAb7rvPiUuRHli1udWcJ50ilKRZUg=";
      }
      {
        name = "vs-code-prettier-eslint";
        publisher = "rvest";
        version = "5.0.4";
        sha256 = "sha256-aLEAuFQQTxyFSfr7dXaYpm11UyBuDwBNa0SBCMJAVRI=";
      }
    ];

    userSettings = {
      "editor.fontFamily" = "'PragmataPro Mono Liga'";
      "editor.fontLigatures" = true;
      "workbench.colorTheme" = "monotone";
      "editor.bracketPairColorization.enabled" = false;
      "vim.leader" = "<Space>";
      "vim.normalModeKeyBindings" = [
        {
          "before" = [ "<TAB>" ];
          "commands" = [ "workbench.action.nextEditor" ];
        }
        {
          "before" = [ "<S-TAB>" ];
          "commands" = [ "workbench.action.previousEditor" ];
        }
        {
          "before" = [ "=" ];
          "after" = [ ":" ];
        }
        {
          "before" = [ "leader" "leader" "p" ];
          "after" = [ "editor.action.quickFix" ];
        }
        {
          "before" = [ "leader" "leader" "r" ];
          "after" = [ "editor.action.rename" ];
        }
      ];
      "vim.insertModeKeyBindings" = [
        {
          "before" = [ "j" "j" ];
          "after" = [ "<ESC>" ];
        }
      ];
      "vim.highlightedyank.enable" = true;
      "vim.highlightedyank.color" = "#FFFFFF30";
      "vim.highlightedyank.duration" = 700;
      "editor.tabCompletion" = "on";
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = false;
      "editor.defaultFormatter" = "rvest.vs-code-prettier-eslint";
    };
  };
}
