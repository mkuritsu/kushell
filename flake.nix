{
  description = "kushell's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      eachSystem = fn: nixpkgs.lib.genAttrs systems (system: fn nixpkgs.legacyPackages.${system});

      mkQuickshellPackage =
        pkgs:
        inputs.quickshell.packages.${pkgs.system}.default.override {
          # Disable uneeded modules to have less things to compile
          withX11 = false;
          withPam = false;
          withI3 = false;
        };
    in
    {
      packages = eachSystem (pkgs: rec {
        default = pkgs.callPackage (import ./package.nix (mkQuickshellPackage pkgs)) { };
        kushell = default;
      });
    };
}
