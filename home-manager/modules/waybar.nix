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
      margin-left = 8;
      margin-right = 8;
      modules-left = [ "hyprland/workspaces" "custom/playerctl" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight" "wireplumber" "battery" "network" "tray" ];

      "custom/playerctl" = {
        format = "<span>{}</span>";
        return-type = "json";
        max-length = 40;
        exec = "playerctl -a metadata --format '{\"text\": \"󰝚 {{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        on-click = "playerctl play-pause";
        on-click-right = "playerctl next";
      };

      "hyprland/workspaces" = {
        all-outputs = false;
        tooltip = false;
      };

      "network" = {
          format-wifi = "  {bandwidthDownBits}";
          format-ethernet = "󰈀 {bandwidthDownBits}";
          format-disconnected = "󰤮 No Network";
          interval = 5;
          tooltip = false;
      };

      "backlight" = {
        format = " {percent}%";
        spacing = 0;
        tooltip = false;
      };
      "tray" = {
        spacing = 0;
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
        format-plugged = "󰂄 {capacity}%";
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
        border-radius: 8px;
        font-size: 14px;
        padding: 0px;
        background: transparent;
      }

      #custom-playerctl {
        background-image: linear-gradient(to bottom, #27232b 100%);

        margin: 6px;
        margin-right: 0px;
        padding: 4px 8px;
        border-radius: 8px;
        color: #E0AAB0;
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
        color: #E0AAB0;

        border-style: none;
        transition-duration: 120ms;
      }

      #clock {
        margin-right: 6px;
      }

      #wireplumber:hover {
        background-image: linear-gradient(to bottom, #ac82e9 100%);
        color: #534856;
        transition-duration: 120ms;
      }

      #tray {
        margin-right: 6px;
      }

      #tray menu {
        background-color: #534856;
        color: #E0AAB0;
        padding: 4px;
      }
      #tray menu menuitem {
        background-image: linear-gradient(to bottom, #27232b 100%);

        margin: 3px;
        color: #867089;
        border-radius: 4px;
        border-style: solid;
        border-color: #27232b;
      }
      #tray menu menuitem:hover {
        background-image: linear-gradient(to bottom, #27232b 100%);
        color: #E0AAB0;
        font-weight: bold;
      }

      #workspaces button {
        transition-duration: 100ms;
        all: initial;
        min-width: 0;
        font-weight: bold;
        color: #867089;
        margin-right: 0.2cm;
        margin-left: 0.2cm;
      }

      #workspaces button:hover {
        transition-duration: 120ms;
        color: #E0AAB0;
      }
      #workspaces button.focused {
        color: #E0AAB0;
        font-weight: bold;
      }
      #workspaces button.active {
        color: #E0AAB0;
        font-weight: bold;
      }
      #workspaces button.urgent {
        color: #fcb167;
      }

      #battery {
        background-color: #27232b;
        color: #E0AAB0;
      }
      #battery.warning,
      #battery.critical,
      #battery.urgent {
        color: #E0AAB0;
        background-color: #fc4649;
      }
      #backlight {
        color: #E0AAB0;
        background-color: #27232b;
        padding: 4px 8px;
        margin: 6px;
        margin-right: 0px;
        border-radius: 8px;
      }
    '';
  };
}
