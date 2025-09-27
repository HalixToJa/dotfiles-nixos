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
      modules-left = [ "river/tags" "custom/playerctl" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight" "wireplumber" "battery" "network" "tray" ];

      "custom/playerctl" = {
        format = "<span>{}</span>";
        return-type = "json";
        max-length = 40;
        exec = "playerctl -a metadata --format '{\"text\": \"󰝚 {{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        on-click = "playerctl play-pause";
        on-click-right = "playerctl next";
        tooltip = false;
      };

      "river/tags" = {
        hide-vacant = true;
        num-tag = 9;
        tooltip = false;
      };

      "network" = {
          format-wifi = "  {bandwidthDownBits}";
          format-ethernet = "󰈀 {bandwidthDownBits}";
          format-disconnected = "󰤮  No Network";
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
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
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
        font-family: DM Mono;
        font-size: 14px;
        background: transparent;
      }

      #custom-playerctl {
        color: #e9ecef;
        margin-right: 6px;
        margin-left: 6px;
      }

      window#waybar {
        background-image: linear-gradient(to bottom, #000000 100%);
        border-style: none;
      }

      #network {
        margin-right: 6px;
        margin-left: 6px;
      }

      #tray {
        margin-right: 6px;
        margin-left: 6px;
      }

      #battery,
      #network,
      #clock,
      #custom-applauncher,
      #tray,
      #workspaces,
      #wireplumber {
        color: #e9ecef;
        margin-right: 6px;
        margin-left: 6px;
        border-style: none;
        transition-duration: 120ms;
      }

      #wireplumber:hover {
        color: #534856;
        transition-duration: 120ms;
      }

      #tray menu {
        color: #e9ecef;
      }
      #tray menu menuitem {
        color: #867089;
      }
      #tray menu menuitem:hover {
        color: #e9ecef;
        font-weight: bold;
      }

      #tags button {
        transition-duration: 100ms;
        all: initial;
        font-weight: bold;
        color: #495057;
        margin-right: 0.15cm;
        margin-left: 0.15cm;
      }

      #tags button:hover {
        transition-duration: 120ms;
        color: #e9ecef;
      }
      #tags button.focused {
        color: #e9ecef;
        font-weight: bold;
      }
      #tags button.urgent {
        color: #fcb167;
      }

      #battery {
        color: #e9ecef;
        margin-right: 6px;
        margin-left: 6px;
      }
      #battery.warning,
      #battery.critical,
      #battery.urgent {
        color: #e9ecef;
        background-color: #fc4649;
      }
      #backlight {
        color: #e9ecef;
        margin-right: 6px;
        margin-left: 6px;
      }
    '';
  };
}
