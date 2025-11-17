{
  lib,
  ...
}:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      river = {
        prettyName = "River";
        comment = "River compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/river";
      };
      #      labwc = {
      #        prettyName = "labwc";
      #        comment = "labwc compositor managed by UWSM";
      #        binPath = "/run/current-system/sw/bin/labwc";
      #      };
    };
  };
  services.dbus.implementation = lib.mkForce "broker";
}
