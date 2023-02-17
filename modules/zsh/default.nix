{ pkgs, lib, config, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "nvim";
      l = "exa -hla --icons";
      lt = "exa -hla --icons --tree --level 2 --git-ignore";
    };
    initExtra = ''
      autoload -U promptinit; promptinit

      export CLICOLOR=1
      export CLICOLOR_FORCE=1
      export LSCOLORS=exfxcxdxbxegedabagacad
      export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

      export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

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
}
