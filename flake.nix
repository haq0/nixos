{
  description = "haquire's config!";

  outputs = inputs @ {
    home-manager,
    nixpkgs,
    ...
  }: {
    packages.x86_64-linux.default =
      nixpkgs.legacyPackages.x86_64-linux.callPackage ./ags { inherit inputs; };

    # nixos config
    nixosConfigurations = {
      "inferno" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/haq/haq.nix
          home-manager.nixosModules.home-manager
          { networking.hostName = "inferno"; }
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    napalm.url = "github:haq0/napalm";
    matugen.url = "github:InioX/matugen?ref=v2.2.0";
  };
}
