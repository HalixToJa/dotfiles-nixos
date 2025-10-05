{pkgs, ...}: {
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    playerctl
    kdePackages.dolphin
    sway-audio-idle-inhibit
    wbg
    ];
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
  wayland.windowManager.river = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
    border-width = 2;
      declare-mode = [
        "normal"
      ];
      map = {
        normal = {
          "Super Q" = "close";
          "Super Return" = "spawn kitty";
          "Super Space" = "spawn 'rofi -show drun'";
          "Super+Shift E" = "exit";
          "Super F" = "toggle-fullscreen";
          "Super G" = "toggle-float";
          "None XF86MonBrightnessDown" = "spawn 'brightnessctl set 5%-'";
          "None XF86MonBrightnessUp" = "spawn 'brightnessctl set +5%'";
          "Shift XF86MonBrightnessDown" = "spawn 'brightnessctl set 1%-'";
          "Shift XF86MonBrightnessUp" = "spawn 'brightnessctl set +1%'";
          "None XF86AudioMute" = "spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'";
          "None XF86AudioLowerVolume" = "spawn 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'";
          "None XF86AudioRaiseVolume" = "spawn 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+'";
          "Super Left" = "focus-view left";
          "Super Right" = "focus-view right";
          "Super Down" = "focus-view down";
          "Super Up" = "focus-view up";

        };
      };
      rule-add = {
        "-app-id" = {
          "'bar'" = "csd";
          "'float*'" = {
            "-title" = {
              "'foo'" = "float";
            };
          };
        };
      };
      spawn = [
        "kanshi"
        "waybar"
        "swayidle"
        "sway-audio-idle-inhibit"
        "'wbg ~/.wallpapers/black.png'"
      ];
      keyboard-layout = "pl";
    };
    extraConfig = let
  pow = base: exp:
    if exp == 0
    then 1
    else base * pow base (exp - 1);
  in ''
      ${builtins.concatStringsSep "\n"
      (builtins.genList (
          i: let
            num = toString (i + 1);
            tag = toString (pow 2 i);
          in ''
            riverctl map normal Super ${num} set-focused-tags ${tag}
            riverctl map normal Super+Shift ${num} spawn 'riverctl set-view-tags ${tag} && riverctl set-focused-tags ${tag}'
            riverctl map normal Super+Control ${num} toggle-focused-tags ${tag}
            riverctl map normal Super+Shift+Control ${num} toggle-viev-tags ${tag}
          ''
        )
        9)}
      #change pointer to yours from riverctl list-inputs
      riverctl input 'pointer-2362-12300-ASUP1415:00_093A:300C_Touchpad' natural-scroll enabled
      riverctl input 'pointer-2362-12300-ASUP1415:00_093A:300C_Touchpad' tap enabled
      riverctl input 'pointer-2362-12300-ASUP1415:00_093A:300C_Touchpad' accel_profile enabled
      riverctl map normal None Print spawn 'grim - | wl-copy'
      riverctl map normal Shift Print spawn 'grim -g "$(slurp)" - | wl-copy'
      riverctl spawn 'rivertile -outer-padding 0 -view-padding 0 -main-ratio 0.5'
      riverctl output-layout rivertile
    '';
  };
}
