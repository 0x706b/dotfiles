{ pkgs, lib, config, ... }:
{
  programs.tmux = {
    enable = true;
    secureSocket = false;
    terminal = "xterm-kitty";
    plugins = with pkgs;
      [ tmuxPlugins.sensible
        { plugin = tmuxPlugins.tmux-colors-solarized;
          extraConfig = ''
            set -g @colors-solarized 'dark'
          '';
        }
      ];
    extraConfig = ''
      # Easy config reload
      bind-key R source-file ~/.tmux.conf \; display-message "tmux.conf reloaded."

      # Enable native Mac OS X copy/paste
      set-option -g default-command "/bin/bash -c 'which reattach-to-user-namespace >/dev/null && exec reattach-to-user-namespace $SHELL -l || exec $SHELL -l'"

      set -g mode-keys vi
      set -g mouse on

      # disable "release mouse drag to copy and exit copy-mode", ref: https://github.com/tmux/tmux/issues/140
      unbind-key -T copy-mode-vi MouseDragEnd1Pane

      # since MouseDragEnd1Pane neither exit copy-mode nor clear selection now,
      # let single click do selection clearing for us.
      bind-key -T copy-mode-vi MouseDown1Pane select-pane\; send-keys -X clear-selection

      # this line changes the default binding of MouseDrag1Pane, the only difference
      # is that we use `copy-mode -eM` instead of `copy-mode -M`, so that WheelDownPane
      # can trigger copy-mode to exit when copy-mode is entered by MouseDrag1Pane
      # bind -n MouseDrag1Pane if -Ft= '#{mouse_any_flag}' 'if -Ft= \"#{pane_in_mode}\" \"copy-mode -eM\" \"send-keys -M\"' 'copy-mode -eM'

      bind-key -T copy-mode-vi 'v' send -X begin-selection

      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      # remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -n M-Left select-window -p
      bind -n M-Right select-window -n

      # kitty terminal
      set -g default-terminal "xterm-kitty"
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
    '';
  };
}
