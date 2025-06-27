{
  description = "kushell's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }@inputs:
    let
      eachSystem =
        fn: nixpkgs.lib.genAttrs (import systems) (system: fn nixpkgs.legacyPackages.${system});
    in
    {
      homeModules = {
        kushell = import ./nix/hm-module.nix { inherit inputs; };
        default = self.homeModules.default;
      };

      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            kdePackages.qtdeclarative
          ];
        };
      });
    };
}
