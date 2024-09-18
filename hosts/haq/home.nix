{ config, pkgs, ... }: {
  news.display = "show";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;
  };

  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none";
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
    stateVersion = "24.05";

    packages = with pkgs; [
      nh
    ];

  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs.home-manager.enable = true;
}
