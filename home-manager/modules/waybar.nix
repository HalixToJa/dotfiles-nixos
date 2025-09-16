_: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        outputs = [
          "eDP-1"
        ];
      layer = "bottom";
      position = "top";
      spacing = 0;
      height = 0;
      margin-bottom = 0;
      margin-top = 8;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight" "network" "battery" "wireplumber" "tray" ];

      "hyprland/workspaces" = {
        all-outputs = false;
        tooltip = false;
      };
      "backlight" = {
        format = "☼ {percent}%";
        spacing = 10;
        tooltip = false;
      };
      "tray" = {
        spacing = 10;
        tooltip = false;
      };
      "clock" = {
        format = "󰅐 {:%H:%M}";
        tooltip = false;
      };
      "wireplumber" = {
        scroll-step = 1;
        max-volume = 100;
        format = "{icon} {volume}%";
        format-icons = [
          ""
          ""
          " "
        ];
        format-muted = " ";
        tooltip = false;
      };
      "battery" = {
        states = {
          "warning" = 30;
          "critical" = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = "󰂄{capacity}%";
        format-alt = "{icon} {time}";
        format-full = "󱈑 {capacity}%";
        format-icons = [
          "󱊡"
          "󱊢"
          "󱊣"
        ];
      };
      };
    };
    style = ''
      * {
        font-family: Maple Mono;
        border-radius: 8;
        font-size: 14px;
        padding: 0px;
        background: transparent;
      }

      window#waybar {
        background-image: linear-gradient(to bottom, #141216 100%);
        border-radius: 14px;
        padding: 0px;
        border-style: none;
      }

      #battery,
      #network,
      #clock,
      #custom-applauncher,
      #tray,
      #workspaces,
      #wireplumber {
        background-image: linear-gradient(to bottom, #27232b 100%);

        margin: 6px;
        margin-right: 0px;
        padding: 4px 8px;
        border-radius: 8px;
        color: #d8cab8;

        border-style: none;
        transition-duration: 120ms;
      }

      #clock {
        margin-right: 6px;
      }

      #wireplumber:hover {
        background-image: linear-gradient(to bottom, #ac82e9 100%);
        color: #141216;
        transition-duration: 120ms;
      }

      #tray menu {
        background-color: #141216;
        color: #d8cab8;
        padding: 4px;
      }
      #tray menu menuitem {
        background-image: linear-gradient(to bottom, #27232b 100%);

        margin: 3px;
        color: #d8cab8;
        border-radius: 4px;
        border-style: solid;
        border-color: #27232b;
      }
      #tray menu menuitem:hover {
        background-image: linear-gradient(to bottom, #27232b 100%);
        color: #ac82e9;
        font-weight: bold;
      }

      #workspaces button {
        transition-duration: 100ms;
        all: initial;
        min-width: 0;
        font-weight: bold;
        color: #d8cab8;
        margin-right: 0.2cm;
        margin-left: 0.2cm;
      }

      #workspaces button:hover {
        transition-duration: 120ms;
        color: #8f56e1;
      }
      #workspaces button.focused {
        color: #ac82e9;
        font-weight: bold;
      }
      #workspaces button.active {
        color: #ac82e9;
        font-weight: bold;
      }
      #workspaces button.urgent {
        color: #fcb167;
      }

      #battery {
        background-color: #222222;
        color: #d8cab8;
      }
      #battery.warning,
      #battery.critical,
      #battery.urgent {
        color: #d8cab8;
        background-color: #fc4649;
      }
      #backlight {
        color: #d8cab8;
        background-color: #222222;
        margin: 6px;
        padding: 4px 8px;
        border-radius: 8px;
      }
    '';
  };
}
