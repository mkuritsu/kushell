{
  description = "kushell's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    eachSystem = fn:
      nixpkgs.lib.genAttrs systems (system: fn nixpkgs.legacyPackages.${system});
  in {
    packages = eachSystem (pkgs: rec {
      default = pkgs.callPackage ./package.nix {};
      kushell = default;
    });

    devShells = eachSystem (pkgs: {
      default = pkgs.callPackage ./shell.nix {};
    });
  };
}
