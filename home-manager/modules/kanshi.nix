_: {
  services.kanshi = {
    enable = true;
    systemdTarget = "river-session.target";
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 2.0;
            status = "enable";
            adaptiveSync = true;
            mode = "2880x1800@120Hz";
          }
        ];
      };

      docked = {
        outputs = [
          {
            criteria = "Dell Inc. DELL SE2416H P7HT8085136B";
            position = "0,0";
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      };
    };
  };
}
