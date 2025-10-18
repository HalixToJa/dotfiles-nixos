{ pkgs, ... }:
{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
}
