{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    systemdTarget = "river-session.target";
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 240; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 300; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
