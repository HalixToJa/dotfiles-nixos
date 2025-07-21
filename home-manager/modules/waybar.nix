{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
        ];
        modules-left = [ "custom/launcher" "cpu" "memory" "custom/media" "tray"];
        modules-center = [ "river/tags" ];
        modules-right = [ "backlight" "wireplumber" "clock" "battery" "custom/power" ];

        "wireplumber" = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          format-icons = {
			        default = ["" "" ""];
	        };
        };

        "river/tags" = {
          num-tags = 5;
        };
        "battery" = {
          states = {
            good = 80;
            warning = 30;
            critical = 15;
          };
        };
        "cpu" = {
          interval = 15;
          format = "{}%";
          max-length = 10;
        };
        "memory" = {
          interval = 30;
          format = "{}%";
          max-length = 10;
        };
      };
    };
    style = ''
      #wireplumber {
	      margin-top: 6px;
      	margin-left: 8px;
        margin-right: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
	      margin-bottom: 6px;
    	  border-radius: 10px;
      	transition: none;
	      color: #1A1826;
    	  background: #FAE3B0;
      }
    '';
  };
}
