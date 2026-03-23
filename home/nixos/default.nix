{ pkgs }:
{
  home.packages =
    with pkgs;
    [ gitui
      unetbootin
      protonvpn-gui
      qbittorrent
      protontricks
      gnomeExtensions.solaar-extension
      solaar
      awakened-poe-trade
      gnupg
      fzf
      bat
      unzip
      fastfetch
      eza
      ripgrep

      modrinth-app-rewrapped

      # Browsers
      google-chrome
      firefox
      brave

      discord

      # 1Password
      _1password-gui
      _1password-cli

      # Audio
      qjackctl
      qpwgraph
      bitwig-studio
      spotify

      # Wine
      wineWow64Packages.yabridge
      yabridge
      yabridgectl
      winetricks
      bottles

      # GPU
      vulkan-tools
      lact

      # Shell
      kitty
    ];

  stylix = {
    autoEnable = true;
    targets.neovim.enable = false;
    targets.waybar = {
      addCss = false;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "PragmataPro Mono Liga" ];
      sansSerif = [ "SFProDisplay Nerd Font" ];
      serif = [ "New York Nerd Font" ];
    };
  };
}
