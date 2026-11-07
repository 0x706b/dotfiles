{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    wofi
    waybar
    hyprpaper
    hyprcursor
    hyprlauncher
    bibata-cursors
    grim
    slurp
    kdePackages.dolphin
    mako
  ];
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    x11.enable = true;
    gtk.enable = true;
  };
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        margin = "4px";
        spacing = 4;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "mpd"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "tray"
          "clock"
        ];
        "hyprland/window" = {
          max-length = 50;
        };
        "tray" = {
          # "icon-size": 21,
          "spacing" = 10;
          # "icons": {
          #   "blueman": "bluetooth",
          #   "TelegramDesktop": "$HOME/.local/share/icons/hicolor/16x16/apps/telegram.png"
          # }
        };
        "clock" = {
          # "timezone": "America/New_York",
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
        "cpu" = {
          "format" = "{usage}% ";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}% ";
        };
        "temperature" = {
          # "thermal-zone": 2,
          # "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
          "critical-threshold" = 80;
          # "format-critical": "{temperatureC}°C {icon}",
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = ["" "" ""];
        };
        "network" = {
          # "interface": "wlp2*", // (Optional) To force the use of this interface
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} 󰌗";
          "tooltip-format" = "{ifname} via {gwaddr} 󰌗";
          "format-linked" = "{ifname} (No IP) 󰌘";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          # "scroll-step": 1, // %, can be a float
          "format" = "{volume}% {icon} {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };
        mpd = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;

          consume-icons = {
            on = " ";
          };

          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };

          repeat-icons = {
            on = " ";
          };

          single-icons = {
            on = "1 ";
          };

          state-icons = {
            paused = "";
            playing = "";
          };

          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
      };
    };
    style = ''
      @import "${./waybar/themes/catppuccin/mocha.css}";
      * {
        font-size: 16px;
        font-family: "PragmataPro";
        color: @text;
      }
      window#waybar {
        border-radius: 8px;
        background-color: alpha(shade(@base, 0.9), 0.75);
        border: 2px solid alpha(@crust, 0.3);
      }
      window#waybar>box {
        padding-left: 8px;
        padding-right: 8px;
      }
      #workspaces button {
        margin: 4px;
        padding: 2px 6px;
      }
      #workspaces button.active {
        background-color: alpha(@surface0, 0.5);
        border-color: transparent;
      }
    '';
  };
  programs.wofi = {
    enable = true;
    style = ''
      window {
        margin: 0px;
        background-color: transparent;
        border-radius: 8px;
      }

      #input {
        margin: 5px;
        border: none;
        color: #cdd6f4;
        background-color: #11111b;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #11111b;
      }

      #outer-box {
        margin: 5px;
        border: none;
        border-radius: 8px;
        background-color: #11111b;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        font-family: "PragmataPro";
        margin: 5px;
        border: none;
        color: #cdd6f4;
      }

      #entry > * {
        color: #cdd6f4;
      }

      #entry:selected {
        background-color: #a6adc8;
      }

      #entry:selected > * {
        color: #1e1e2e;
      }

      #entry:selected #text {
        color: #1e1e2e;
        font-weight: bold;
      }
    '';
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    ];
    settings = {
      "$mainMod" = "SUPER";
      "$browser" = "brave";
      "$terminal" = "wezterm";
      "$fileManager" = "wezterm -e yazi";
      "$menu" = "wofi --show drun";
      env = [
        # nvidia
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
        "NVD_BACKEND,direct"
        "__GL_GSYNC_ALLOWED,1"

        # hyprcursor
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"

        # xcursor
        "XCURSOR_SIZE,24"
      ];
      monitor = [
        "DP-1,2560x1440@240,auto,1"
        "DP-3,3840x1600@144,auto-center-up,1"
      ];
      render = {
        direct_scanout = 1;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      exec-once = [
        "waybar"
        "$browser"

        "openrgb -p 1"

        "[workspace 1 silent] brave"
        "[workspace 2 silent] $terminal"
      ];
      input = {
        kb_layout = "us";
        repeat_rate = 60; # /sec
        repeat_delay = 150; # ms

        accel_profile = "flat";
        sensitivity = 0;
      };
      plugin = [
        # {
        #   hyprbars = {
        #     bar_height = 32;
        #     bar_blur = true;
        #     bar_text_size = 12;
        #     bar_precedence_over_border = true;
        #     bar_text_font = "PragmataPro Mono";
        #     bar_button_padding = 6;
        #     bar_padding = 12;
        #     hyprbars-button = "rgb(ff4040),16,,hyprctl dispatch killactive";
        #   };
        # }
        # {
        #   hyprexpo = {
        #     columns = 3;
        #     gap_size = 5;
        #     bg_col = "rgb(111111)";
        #     workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1
        #
        #     gesture_distance = 300; # how far is the "max" for the gesture
        #   };
        # }
      ];
      windowrule = [
        # {
        #   name = "no-hyprbars-on-non-floating";
        #   "match:float" = false;
        #   "hyprbars:no_bar" = true;
        # }
        "no_initial_focus 1, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"
        "match:class ^Minecraft.*, immediate yes"
        "match:class gamescope, immediate yes"
      ];
      layerrule = [
        "blur on, match:namespace waybar"
      ];
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, M, exit"
        "$mainMod, C, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
        # "$mainMod, G, hyprexpo:expo, toggle"
        "$mainMod SHIFT, F, fullscreen"

        # Screenshot + Copy
        ''$mainMod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy''

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        # "$mainMod, S, togglespecialworkspace, magic"
        # "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      cursor = {
        enable_hyprcursor = true;
        no_hardware_cursors = 1;
      };
      general = {
        gaps_in = 8;
        gaps_out = 8;

        border_size = 2;

        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true;

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = true;

        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "rgba(1a1a1aee)";
        };

        # https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };
      misc = {
        vrr = 1;
      };
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = "${./wallpaper/wallace-henry-G-5JCERzbE8-unsplash-extended.png}";
        }
      ];
    };
  };
}
