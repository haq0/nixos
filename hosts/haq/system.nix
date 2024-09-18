{ config, pkgs, ... }: {
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    max-jobs = 2;
    auto-optimise-store = true;
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    git
    wget
    zsh
  ];


  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "inferno";
    # use network manager for internet
    networkmanager.enable = true;
    # set nameservers
    nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    # setup firewall
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; }
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; }
      ];
    };
  };

  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_US.UTF-8";

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      # enable the nvidia-settings
      nvidiaSettings = true;
      # set to beta driver, stable is good too
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
      dnsovertls = "true";
    };
    xserver = {
      videoDrivers = [ "nvidia" ];
      excludePackages = [ pkgs.xterm ];
    };
    # i personally use mullvad, however you can change to nord or whatever
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    blueman.enable = true;
    # pipewire >> pulseaudio
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      }
      pulse.enable = true;
    };
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}




