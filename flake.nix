{
  description = "W chuja cięcie też zajęcie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-cachyos-kernel,
      nur,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          inputs.spicetify-nix.nixosModules.spicetify
          ./nixos/overlays/wlroots.nix
          ./nixos/overlays/xwayland.nix
          nur.modules.nixos.default
          nur.legacyPackages."${system}".repos.iopq.modules.xraya
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [
                nix-cachyos-kernel.overlays.pinned
              ];
              imports = [ ./nixos/configuration.nix ];
            }
          )
        ];
      };

      homeConfigurations.halix = home-manager.lib.homeManagerConfiguration rec {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/home.nix
          { nix.package = pkgs.nix; }
        ];
      };

      formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    };
}
