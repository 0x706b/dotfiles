{ nixpkgs, inputs, home-manager, user, pkgs, nil, system, lib, config, hm, isDarwin, isLinux, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit isDarwin isLinux;
    };
    users.${user} = { pkgs, ... }: {

      imports =
        [ ./modules/zsh
          ./modules/neovim
          ./modules/kitty
          ./modules/tmux
          ./modules/yabai
        ] ++ lib.optionals isLinux [ ./nixos/home.nix ]
          ++ lib.optionals isDarwin [ ./darwin/home.nix ];

      home.stateVersion = "22.05";

      home.packages =
        with pkgs; [ # Starship terminal prompt
          starship
          clang
          # (import ./packages/starship.nix { inherit pkgs; })
          # pkgs.haskell.compiler."ghc${ghc-version}"
          # pkgs.haskell.packages."ghc${ghc-version}".haskell-language-server
          # pkgs.ghcid
          # pkgs.stack
          # pkgs.haskellPackages.cabal-install
          nil.packages.${system}.default
          exa
          gnupg
          gh
          fzf
          nodejs-19_x
          yarn
          bat
          nix-prefetch-git
          nodePackages.pnpm
          woff2
          ruby
        ];

      # home.activation = lib.mkIf pkgs.stdenv.isDarwin {
      #   copyApplications = let
      #     apps = pkgs.buildEnv {
      #       name = "home-manager-applications";
      #       paths = home.packages;
      #       pathsToLink = "/Applications";
      #     };
      #   in hm.dag.entryAfter [ "writeBoundary" ] ''
      #     baseDir="$HOME/Applications/Home Manager Apps"
      #     if [ -d "$baseDir" ]; then
      #       rm -rf "$baseDir"
      #     fi
      #     mkdir -p "$baseDir"
      #     for appFile in ${apps}/Applications/*; do
      #       target="$baseDir/$(basename "$appFile")"
      #       $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
      #       $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
      #     done
      #   '';
      # };
    };
  };
}

