{
  inputs,
  user,
  isWsl,
  ghc-version,
  ...
}:
let
  extraImports =
    if isWsl then
      [ ./modules/vscode-server ]
    else
      [
        ./home/nixos
        ./modules/yazi
        ./modules/hypr
        ./modules/kitty
        ./modules/wezterm
        ./modules/vscode
      ];
in
{
  home-manager = {
    extraSpecialArgs = { inherit inputs isWsl user; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} =
      { pkgs, ... }:
      {
        imports = [
          ./modules/neovim
          ./modules/tmux
          ./modules/git
          ./modules/zellij
          ./modules/npm
          ./modules/starship
        ]
        ++ extraImports;

        home.stateVersion = "26.05";

        home.file.".jdk/zulu25".source = pkgs.zulu25;
        home.file.".jdk/zulu".source = pkgs.zulu;

        home.packages = with pkgs; [
          # Utilities
          jq
          nixfmt
          ollama
          llama-cpp
          lsof
          gitui
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
          woff2
          gel
          zjstatus
          (writeShellScriptBin "upfind" ''
            DIR=$PWD

            while
              RESULT=$(find "$DIR"/ -maxdepth 1 -name "$@" )
              # echo "Debugging upfind - search in $DIR gives: $RESULT"
              [[ -z $RESULT ]] && [[ "$DIR" != "/" ]]
            do DIR=$(dirname "$DIR"); done

            echo "$RESULT"
          '')

          # Shell
          starship

          # Haskell
          haskell.compiler."ghc${ghc-version}"
          haskell.packages."ghc${ghc-version}".haskell-language-server

          # Nix
          nix-prefetch-git
          inputs.nil.packages.${pkgs.stdenv.hostPlatform.system}.default

          # GitHub
          gh

          # JavaScript
          nodejs_24
          yarn
          pnpm
          vscode-langservers-extracted

          # Lua
          lua-language-server

          # Ruby
          ruby

          # Kubernetes
          kubectl
          minikube

          # Docker
          docker

          # Java
          # zulu

          # Scala
          ammonite
          coursier
          scala
          scala-cli
          sbt
          scalafmt
          metals
          gradle

          # Rust
          rustc
          rust-analyzer
          cargo

          # Go
          go
          gel

          # C++
          clang
          clang-tools
          gnumake

          # AI
          # opencode

          # Python
          python3
        ];

        programs.zsh = {
          enable = true;
          shellAliases = {
            v = "nvim";
            "v." = "nvim $HOME/dotfiles/flake.nix";
            ga = "git add --all";
            gc = "git commit";
            l = "exa -hla --icons";
            lt = "exa -hla --icons --tree --level 2 --git-ignore";
            prettier-eslint_d = "~/.config/nvim/prettier-eslint_d.sh";
            "rebuild." = ''
              pushd ~/dotfiles
              sudo nixos-rebuild switch --flake .
              popd
            '';
            clean-generations = ''
              pushd ~/dotfiles
              sudo nix-collect-garbage --delete-old -d
              sudo nixos-rebuild switch --flake .
              popd
            '';
          };
          initContent = ''
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

            export PATH="$(npm config get prefix)/bin:$PATH:$HOME/.gem/ruby/2.7.0/bin:$HOME/go/bin/windows_amd64"

            if [ -n "''${NVIM_LISTEN_ADDRESS+x}" ]; then
              export COLORTERM="truecolor"
            fi

            # fastfetch

            export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
          ''
          + pkgs.lib.optionalString isWsl ''
            # Configure ssh forwarding
            export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
            # need `ps -ww` to get non-truncated command for matching
            # use square brackets to generate a regex match for the process we want but that doesn't match the grep command running it!
            ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
            if [[ $ALREADY_RUNNING != "0" ]]; then
                if [[ -S $SSH_AUTH_SOCK ]]; then
                    # not expecting the socket to exist as the forwarding command isn't running (http://www.tldp.org/LDP/abs/html/fto.html)
                    echo "removing previous socket..."
                    rm $SSH_AUTH_SOCK
                fi
                echo "Starting SSH-Agent relay..."
                # setsid to force new session to keep running
                # set socat to listen on $SSH_AUTH_SOCK and forward to npiperelay which then forwards to openssh-ssh-agent on windows
                (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
            fi
          '';

          zplug = {
            enable = true;
            plugins = [
              {
                name = "mafredri/zsh-async";
                tags = [
                  "from:github"
                  "defer:0"
                ];
              }
              {
                name = "zsh-users/zsh-syntax-highlighting";
                tags = [ "defer:2" ];
              }
              {
                name = "plugins/git";
                tags = [ "from:oh-my-zsh" ];
              }
              {
                name = "lib/completion";
                tags = [ "from:oh-my-zsh" ];
              }
              {
                name = "lib/history";
                tags = [ "from:oh-my-zsh" ];
              }
              {
                name = "lib/theme-and-appearance";
                tags = [ "from:oh-my-zsh" ];
              }
              { name = "zsh-users/zsh-autosuggestions"; }
              { name = "chrissicool/zsh-256color"; }
              { name = "zsh-users/zsh-completions"; }
            ];
          };
        };
      };
  };
}
