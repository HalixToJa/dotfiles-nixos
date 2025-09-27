{ pkgs, ... }: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.pam.services.swaylock = {};
  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
