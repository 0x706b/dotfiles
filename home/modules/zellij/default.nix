{ ... }:
{
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
    # layouts = {
    #   default = {
    #     layout = {
    #       _children = [
    #         {
    #           default_tab_template = {
    #             _children = [
    #               { "children" = { }; }
    #               {
    #                 pane = {
    #                   _props = {
    #                     size = 2;
    #                     borderless = true;
    #                   };
    #                   plugin = {
    #                     _props = {
    #                       location = "file://${pkgs.zjstatus}/bin/zjstatus.wasm";
    #                     };
    #                     format_left = "{mode} #[fg=#89B4FA,bold]{session}";
    #                     format_center = "{tabs}";
    #                     format_right = "{command_git_branch} {datetime}";
    #                     format_space = "";
    #
    #                     border_enabled ="true";
    #                     border_char = "";
    #                     border_format = "#[fg=#6C7086]{char}";
    #                     border_position = "top";
    #
    #                     hide_frame_for_single_pane = "true";
    #
    #                     mode_normal = "#[bg=blue] ";
    #                     mode_tmux = "#[bg=#ffc387] ";
    #
    #                     tab_normal = "#[fg=#6C7086] {name} ";
    #                     tab_active = "#[fg=#9399B2,bold,italic] {name} ";
    #
    #                     command_git_branch_command = "git rev-parse --abbrev-ref HEAD";
    #                     command_git_branch_format = "#[fg=blue] {stdout} ";
    #                     command_git_branch_interval = "10";
    #                     command_git_branch_rendermode = "static";
    #
    #                     datetime = "#[fg=#6C7086,bold] {format} ";
    #                     datetime_format = "%A, %d %b %Y %H:%M";
    #                     datetime_timezone = "US/Pacific";
    #                   };
    #                 };
    #               }
    #             ];
    #           };
    #         }
    #       ];
    #     };
    #   };
    # };
    settings = {
      theme = "vague";

      themes.vague = {
        bg = "#141415";
        fg = "#cdcdcd";
        red = "#d8647e";
        green = "#7fa563";
        blue = "#6e94b2";
        yellow = "#f3be8c";
        magenta = "#bb9dbd";
        orange = "#f3be8c";
        cyan = "#aeaed1";
        black = "#141415";
        white = "#cdcdcd";
      };

      themes.mellifluous = {
        bg = "#151515";
        fg = "#C8C8C8";
        red = "#D59192";
        green = "#B3B393";
        blue = "#A8A1BE";
        yellow = "#BFAF8E";
        magenta = "#B99BB5";
        orange = "#BFAF8E";
        cyan = "#A8A1BE";
        black = "#151515";
        white = "#5B5B5B";
      };

      themes.mellifluous-light = {
        bg = "#e1e1e1";
        fg = "#111111";
        red = "#b73242";
        green = "#63611e";
        blue = "#5a418a";
        yellow = "#9c7a2a";
        magenta = "#863e7f";
        orange = "#9c7a2a";
        cyan = "#5a418a";
        black = "#e1e1e1";
        white = "#919191";
      };

      themes.kanagawa = {
        bg = "#1f1f28";
        fg = "#dcd7ba";
        red = "#c34043";
        green = "#76946a";
        blue = "#7e9cd8";
        yellow = "#c8c093";
        magenta = "#957fb8";
        orange = "#c0a36e";
        cyan = "#6a9589";
        black = "#090618";
        white = "#727169";
      };

      themes.kanagawa-dragon = {
        bg = "#181616";
        fg = "#c5c9c5";
        red = "#C4746E";
        green = "#8A9A7B";
        blue = "#7e9cd8";
        yellow = "#C8C093";
        magenta = "#A292A3";
        orange = "#C4B28A";
        cyan = "#8EA4A2";
        black = "#181616";
        white = "#727169";
      };

      default_mode = "locked";
      pane_frames = false;
      simplified_ui = true;
    };
  };
}
