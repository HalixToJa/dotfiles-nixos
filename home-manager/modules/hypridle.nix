_: {
  services.hypridle = {
    enable = true;
    settings = {
      "$lock_cmd" = "pidof hyprlock || hyprlock";
      "$suspend_cmd" = "systemctl suspend || loginctl suspend";
      general = {
        lock_cmd = "$lock_cmd";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprlock";
        inhibit_sleep = 3;
      };

      listener = [
        {
          timeout = 240;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 300;
          on-timeout = "brightnessctl set 0";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 900;
          on-timeout = "$suspend_cmd";
        }
      ];
    };
  };
}
