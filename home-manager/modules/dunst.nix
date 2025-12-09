_: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        #width = "(200,300)";
        #height = "(0,150)";
        #offset = "(30,50)";
        #origin = "top-right";
        transparency = 10;
        frame_color = "#e9ecef";
        font = "Maple Mono 10";
      };

      urgency_normal = {
        background = "#000000";
        foreground = "#eceff1";
        timeout = 10;
      };
    };
  };
}
