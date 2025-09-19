_: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpaper/wallpaper1.jpg" ];
      wallpaper = [
        "eDP-1, ~/.wallpaper/wallpaper1.jpg"
        "HDMI-A-1, ~/.wallpaper/wallpaper1.jpg"
      ];
    };
  };
}
