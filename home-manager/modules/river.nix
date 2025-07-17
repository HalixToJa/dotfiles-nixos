{ config, pkgs, inputs, ... }: {
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    settings = {
      rule-qdd = {
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
        "waybar"
        "rivertile"
      ];
      map = {
        normal = {
          "Super Space" = "spawn 'wofi --show drun run'";
          "Super Q" = "close";
          "Super Return" = "spawn konsole";
          "Super+Shift E" = "exit";

          "Super F" = "toggle-fullscreen";
          
          "None XF86MonBrightnessUp" = "spawn 'brightnessctl set +5%'";
          "None XF86MonBrightnessDown" = "spawn 'brightnessctl set 5%-'";
        };
      };
    };
    extraConfig = let
      pow = base: exp:
        if exp == 0 then 1 else base * pow base (exp - 1);
        in ''
    ${builtins.concatStringsSep "\n" (builtins.genList (i:
      let
        num = toString (i + 1);
        tag = toString (pow 2 i);
      in ''
        riverctl map normal Super ${num} set-focused-tags ${tag}
        riverctl map normal Super+Shift ${num} set-viev-tags ${tag}
        riverctl map normal Super+Control ${num} toggle-focused-tags ${tag}
        riverctl map normal Super+Shift+Control ${num} toggle-viev-tags ${tag}
      ''
    ) 9)}
    '';
  };
}
