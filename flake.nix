{
  description = "W chuja cięcie też zajęcie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nixunstable.url = "github:nixos/nixpkgs/nixos-unstable";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nyx-loner.url = "github:lonerOrz/nyx-loner";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixunstable,
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
          inputs.nyx-loner.nixosModules.default
          ./nixos/overlays/wlroots.nix
          ./nixos/overlays/xwayland.nix
          {
            _module.args = {
              nixunstablepkgs = import nixunstable {
                inherit system;
              };
            };
          }
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
