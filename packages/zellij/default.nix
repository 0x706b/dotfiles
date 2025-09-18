{ ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "mellifluous";

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
        bg = "#1D1D1D";
        fg = "#C8C8C8";
        red = "#D59192";
        green = "#B3B393";
        blue = "#A8A1BE";
        yellow = "#BFAF8E";
        magenta = "#B99BB5";
        orange = "#BFAF8E";
        cyan = "#A8A1BE";
        black = "#1D1D1D";
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

      default_mode = "locked";
    };
  };
}
