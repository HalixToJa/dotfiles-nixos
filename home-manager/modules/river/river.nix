{ pkgs, ... }: {

  home.packages = with pkgs; [
    xorg.xprop
    wofi
    wlr-randr
    ];

  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river_git;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      map = {
        normal = {
          "Super+Shift E" = "exit";
          "Super Q" = "close";
          "Super Return" = "spawn alacritty";
        };
      };
    };
  };
}
