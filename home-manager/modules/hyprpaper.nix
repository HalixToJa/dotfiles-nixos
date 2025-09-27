_: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpaper/black.png" ];
      wallpaper = [
        "eDP-1, ~/.wallpaper/black.png"
        "HDMI-A-1, ~/.wallpaper/black.png"
      ];
    };
  };
}
