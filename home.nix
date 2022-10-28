{ nixpkgs, inputs, home-manager, user, pkgs, nil, system, lib, config, hm, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = { pkgs, ... }: {
      imports =
        [ ./packages/neovim
          ./packages/tmux
        ];
      home.stateVersion = "22.05";
      home.packages =
        [ # Starship terminal prompt
          (import ./packages/starship.nix { inherit pkgs; })
          # Glasgow Haskell Compiler
          pkgs.haskell.compiler.ghc924
          # Haskell Language Server
          (pkgs.haskell-language-server.overrideAttrs (p: {
            doCheck = false;
            supportedGhcVersions = [ "884" "924" ];
          }))
          # Nix Language Server
          nil.packages.${system}.default
          # exa (ls replacement)
          pkgs.exa
          pkgs.gnupg
          pkgs.gh
          pkgs.fzf
          pkgs.nodejs-18_x
          pkgs.bat
          # nix utilities
          pkgs.nix-prefetch-git
          pkgs.nodePackages.pnpm
        ];
      programs.zsh = {
        enable = true;
        shellAliases = {
          v = "nvim";
          l = "exa -hla --icons";
          lt = "exa -hla --icons --tree --level 2 --git-ignore";
        };
        initExtra = ''
          AUTOLOAD="$HOME/.autoload"
          autoload -U promptinit; promptinit
          # Source all files in $AUTOLOAD having file extension .zsh
          for file in $AUTOLOAD/*.zsh; do
              source "$file"
          done

          export CLICOLOR=1
          export CLICOLOR_FORCE=1
          export LSCOLORS=exfxcxdxbxegedabagacad
          export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

          zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

          eval "$(starship init zsh)"
          if [ -n "''${NVIM_LISTEN_ADDRESS+x}" ]; then
            export COLORTERM="truecolor"
          fi
        '';
        zplug = {
          enable = true;
          plugins =
            [ { name = "mafredri/zsh-async"; tags = [ "from:github" "defer:0" ]; }
              { name = "zsh-users/zsh-syntax-highlighting"; tags = [ "defer:2" ]; }
              { name = "plugins/git"; tags = [ "from:oh-my-zsh" ]; }
              { name = "lib/completion"; tags = [ "from:oh-my-zsh" ]; }
              { name = "lib/history"; tags = [ "from:oh-my-zsh" ]; }
              { name = "lib/termsupport"; tags = [ "from:oh-my-zsh" ]; }
              { name = "lib/theme-and-appearance"; tags = [ "from:oh-my-zsh" ]; }
              { name = "zsh-users/zsh-autosuggestions"; }
              { name = "chrissicool/zsh-256color"; }
            ];
        };
      };
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

