{ lib, ... }:
{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.pam.services.hyprlock = { };
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
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      river = {
        prettyName = "River";
        comment = "River compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/river";
      };
    };
  };
  services.dbus.implementation = lib.mkForce "broker";
}
