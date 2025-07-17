{
  description = "W chuja cięcie też zajęcie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, chaotic, home-manager, ... }:
  let
      system = "x86_64-linux";
  in {
  nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./nixos/configuration.nix
        chaotic.nixosModules.default 
        ];
  };

    homeConfigurations.halix = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
  };
}
