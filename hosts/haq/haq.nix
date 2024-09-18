{ inputs, lib, pkgs, ... }: let
  username = "haq";
in {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./system.nix
  ];

  users.users.${username} = {
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    shell = pkgs.zsh;
    initialPassword = username;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };


  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.${username} = {
      home = {
        username = username;
        homeDirectory = "/home/${username}";
      };
      imports = [
        ./home.nix
        ../../home-manager/misc/spicetify.nix
        ../../home-manager/filemanagers/yazi.nix
        ../../home-manager/terminals/foot.nix
        ../../home-manager/terminals/kitty.nix
        ../../home-manager/ui/ags.nix
        ../../home-manager/ui/theme.nix
        ../../home-manager/ui/hyprland.nix
      ];
    };
  };
}
