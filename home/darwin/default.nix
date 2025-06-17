{ user, nil, system, ghc-version, isWsl, ... }:
{
  home-manager = {
    extraSpecialArgs = { inherit isWsl; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = { pkgs, ... }: {
      imports =
        [ ../../packages/neovim
          ../../packages/kitty
          ../../packages/tmux
          ../../packages/git
          ../../packages/warp
          ../../packages/zellij
          ../../packages/wezterm
        ];
      home.stateVersion = "22.05";
      home.packages =
        with pkgs; [ # Starship terminal prompt
          starship
          # haskell.compiler."ghc${ghc-version}"
          # haskell.packages."ghc${ghc-version}".haskell-language-server
          # ghcid
          # stack
          # haskellPackages.cabal-install
          nil.packages.${system}.default
          eza
          gnupg
          gh
          fzf
          nodejs_22
          yarn
          bat
          nix-prefetch-git
          nodePackages.pnpm
          woff2
          ruby
          ripgrep
          minikube
          docker
          clang
          llvmPackages.libcxxStdenv
          git-lfs
          detekt
          python311
          kfilt
          _1password-cli
          mkdocs
          gitui
          google-cloud-sdk
          (import ../../packages/upfind.nix pkgs)
          (import ../../packages/launch-nvim-in-kitty.nix pkgs)
          go
          yamllint
          postgresql_17
          tilt
          alacritty
          # sops
        ];
      programs.zsh = {
        enable = true;
        shellAliases = {
          # nvim = "kitten @ --to unix:/tmp/nvim-client launch --copy-env --cwd $PWD launch-nvim-in-kitty";
          ngdev = "$HOME/dev/ng/ng-delivery/ngdev";
          "v." = "nvim $HOME/dotfiles/flake.nix";
          ga = "git add --all";
          gc = "git commit";
          v = "nvim";
          l = "exa -hla --icons";
          lt = "exa -hla --icons --tree --level 2 --git-ignore";
          "rebuild." = "pushd ~/dotfiles; sudo darwin-rebuild switch --flake .#MacBook-Pro; popd";
        };
        initExtra = ''
          AUTOLOAD="$HOME/.autoload"
          autoload -U promptinit; promptinit
          # Source all files in $AUTOLOAD having file extension .zsh
          # for file in $AUTOLOAD/*.zsh; do
          #    source "$file"
          # done

          export EDITOR=nvim
          export CLICOLOR=1
          export CLICOLOR_FORCE=1
          export LSCOLORS=exfxcxdxbxegedabagacad
          export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

          zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

          export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin:/Users/pkrol/.npm_global/bin:$HOME/.krew/bin:/opt/homebrew/bin:$HOME/go/bin"

          eval "$(starship init zsh)"
          if [ -n "''${NVIM_LISTEN_ADDRESS+x}" ]; then
            export COLORTERM="truecolor"
          fi

          printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

          export NVM_DIR="$HOME/.nvm"
          [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
          [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

          typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=15"
        '';
        zplug = {
          enable = true;
          plugins =
            [ { name = "mafredri/zsh-async"; tags = [ "from:github" "defer:0" ]; }
              { name = "zsh-users/zsh-syntax-highlighting"; tags = [ "defer:2" ]; }
              { name = "plugins/git"; tags = [ "from:oh-my-zsh" ]; }
              { name = "lib/completion"; tags = [ "from:oh-my-zsh" ]; }
              { name = "lib/history"; tags = [ "from:oh-my-zsh" ]; }
              # { name = "lib/termsupport"; tags = [ "from:oh-my-zsh" ]; }
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

