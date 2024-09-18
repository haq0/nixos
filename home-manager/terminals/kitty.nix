{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      # Font settings
      font_family = "Iosevka ";
      bold_font = "Iosevka";
      italic_font = "Iosevka";
      bold_italic_font = "Iosevka";
      font_size = 16;

      # Window settings
      remember_window_size = "no";
      initial_window_width = "1000";
      initial_window_height = "650";
      window_padding_width = 4;
      hide_window_decorations = "yes";

      # Tab bar settings
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      active_tab_font_style = "bold";

      # Catppuccin Mocha Color Scheme
      # Backgrounds
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      selection_background = "#585b70";
      selection_foreground = "#cdd6f4";

      # Cursor colors
      cursor = "#f5e0dc";
      cursor_text_color = "#1e1e2e";

      # URL underline color when hovering with mouse
      url_color = "#f5e0dc";

      # Kitty window border colors
      active_border_color = "#b4befe";
      inactive_border_color = "#6c7086";
      bell_border_color = "#f9e2af";

      # Tab bar colors
      active_tab_background = "#cba6f7";
      active_tab_foreground = "#11111b";
      inactive_tab_background = "#181825";
      inactive_tab_foreground = "#cdd6f4";
      tab_bar_background = "#11111b";

      # Normal colors
      color0 = "#45475a";
      color1 = "#f38ba8";
      color2 = "#a6e3a1";
      color3 = "#f9e2af";
      color4 = "#89b4fa";
      color5 = "#f5c2e7";
      color6 = "#94e2d5";
      color7 = "#bac2de";

      # Bright colors
      color8 = "#585b70";
      color9 = "#f38ba8";
      color10 = "#a6e3a1";
      color11 = "#f9e2af";
      color12 = "#89b4fa";
      color13 = "#f5c2e7";
      color14 = "#94e2d5";
      color15 = "#a6adc8";

      # Cursor settings
      cursor_shape = "underline";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15.0";

      # Scrollback settings
      scrollback_lines = 100000;

      # URL settings
      url_style = "curly";

      # Performance tuning
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";

      # Bell settings
      enable_audio_bell = "no";
      visual_bell_duration = "0.0";
      window_alert_on_bell = "yes";

      # Advanced settings
      shell = "zsh";
      editor = "nvim";
      term = "xterm-kitty";
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+l" = "next_layout";
      "ctrl+shift+." = "move_tab_forward";
      "ctrl+shift+," = "move_tab_backward";
      "ctrl+shift+alt+t" = "set_tab_title";
    };
  };
}


