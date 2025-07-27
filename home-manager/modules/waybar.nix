_: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = "true";
        height = 30;
        output = [
          "eDP-1"
        ];
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "WirePlumber" "bluetooth" "network" "battery" ];
      };
    };
    style = ''
    '';
  };
}
