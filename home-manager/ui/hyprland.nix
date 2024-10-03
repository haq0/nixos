{
  inputs,
  pkgs,
  ...
}: let
  hyprland = pkgs.hyprland;

  # scripts
  yt = pkgs.writeShellScript "yt" ''
    notify-send "Opening video" "$(wl-paste)"
    mpv "$(wl-paste)"
  '';

  spotui = pkgs.writeShellScript "spotui" ''
    # your spotui script here
  '';

  wall = pkgs.writeShellScript "wall" ''
    # your wall script here
  '';

  lock = pkgs.writeShellScript "lock" ''
    # your lock script here
  '';

in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      env = {
        LIBVA_DRIVER_NAME = "nvidia";
        OBSIDIAN_USE_WAYLAND = "1";
        EDITOR = "nvim";
        XDG_SESSION_TYPE = "wayland";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      };

      xwayland = {
        force_zero_scaling = false;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      monitor = [
        "DVI-D-1, 1920x1080@144.0, 0x0, 1.0"
        "HDMI-A-1, 3840x2160@60.0, 1920x0, 2.0"
        "DP-1, 1920x1080@240.0, 3840x0, 1.0"
        "Unknown-1, 1920x1080@60.0, 7680x0, 1.0"
        "Unknown-1, disable"
      ];

      workspace = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
      ];

      exec-once = [
        "ags"
        "pypr"
        "hyprctl dispatch workspace 3"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        force_no_accel = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        col.inactive_border = "rgba(595959aa)";
        layout = "dwindle";
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      decoration = {
        rounding = 12;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        disable_hyprland_logo = "yes";
        enable_swallow = true;
      };

      windowrule = [
        "float, ^(pavucontrol)$"
        "float, ^(nm-connection-editor)$"
        "opacity 0.80, foot"
      ];

      bind = let
        mainMod = "ALT";
      in [
        "${mainMod} SHIFT, RETURN, exec, foot"
        "${mainMod}, U, exec, zen"
        "${mainMod} SHIFT, D, exec, ${spotui}"
        "${mainMod} SHIFT, C, killactive,"
        "${mainMod}, M, exit,"
        "${mainMod}, T, togglefloating,"
        "${mainMod}, P, exec, ags -t launcher"
        "${mainMod}, H, exec, grimshot copy area"
        "${mainMod} SHIFT, P, exec, ${wall}"
        "${mainMod} SHIFT, H, exec, ${yt}"
        "${mainMod} SHIFT, U, exec, ${lock}"
        "${mainMod} SHIFT, F, exec, pypr toggle term && hyprctl dispatch bringactivetotop"
        "${mainMod}, F, exec, pypr toggle nnn && hyprctl dispatch bringactivetotop"
        "${mainMod} SHIFT, D, exec, pypr toggle music"
      ];

      bindm = let
        mainMod = "ALT";
      in [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];
    };
  };
}

