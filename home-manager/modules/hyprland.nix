{pkgs, ...}: {
  home.packages = with pkgs; [
    grim
    slurp
    ags
    rofi
    wl-clipboard
    playerctl
    kdePackages.dolphin
    ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    settings = {
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$exec" = "exec, uwsm app --";

        bind = [
            "$mainMod, F, fullscreen"
            "$mainMod, G, togglefloating"

            "$mainMod, RETURN, $exec $terminal"
            "$mainMod, Q, killactive"
            "$mainMod SHIFT, E, exit"
            "$mainMod, SPACE, $exec rofi -show drun"

            #function
            ",XF86MonBrightnessDown, $exec brightnessctl set 1%-"
            ",XF86MonBrightnessUp, $exec brightnessctl set +1%"
            ",XF86AudioMute, $exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioLowerVolume, $exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioRaiseVolume, $exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"

            # workspace
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"
        ];
    };
    extraConfig = ''
    bind = , Print, exec, grim - | wl-copy
    bind = SHIFT, Print, exec, grim -g "$(slurp)" - | wl-copy

# monitor = eDP-1, disable

 monitor = HDMI-A-1, disable    

    monitorv2 {
        output = eDP-1
        mode = 2880x1800@120
        position = 0x0
        scale = 2
        vrr = 1
    }
 #   monitorv2 {
 #       output = HDMI-A-1
 #       mode = 1920x1080@60
 #       position = 0x1800
 #       scale = 1
 #   }

    xwayland {
        force_zero_scaling = 1
    }

    # Autostart
    exec-once = uwsm app -- waybar
    exec-once = systemctl --user enable --now hypridle.service
    exec-once = systemctl --user enable --now hyprpaper.service

    # Input config
    input {
        kb_layout = pl

        follow_mouse = 1

        touchpad {
            natural_scroll = true
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {

        gaps_in = 4
        gaps_out = 8
        border_size = 2
        col.active_border = rgba(555169ff)
        col.inactive_border = rgba(473738ff)

        layout = dwindle
    }
    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    decoration {
        rounding = 10
        windowrule = opacity 0.8, initialTitle:^(kitty.*)$

        blur {
            enabled = true
            size = 6
            passes = 3
            new_optimizations = on
            ignore_opacity = on
            xray = false
        }

        shadow {
            enabled = false
        }
    }

    layerrule = blur, waybar

    cursor {
        no_hardware_cursors = true
    }

    animations {
        enabled = no

        bezier = ease,0.4,0.02,0.21,1

        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
    }
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    bindm = ALT, mouse:272, resizewindow

    env = ELECTRON_OZONE_PLATFORM_HINT,wayland
    env = GDK_SCALE,2
    env = XCURSOR_SIZE,32
        '';
  };
}
