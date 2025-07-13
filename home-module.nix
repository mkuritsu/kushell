inputs:
{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.programs.kushell;
in
{
  options.programs.kushell = {
    enable = lib.mkEnableOption "kushell";

    package = lib.mkOption {
      type = lib.types.package;
      description = "The Quickshell package to use";
      default = (inputs.quickshell.packages.${pkgs.system}.default.override {
        withX11 = false;
        withPam = false;
        withI3 = false;
      });
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."quickshell/kushell".source = ./.;

    home.packages = [
      cfg.package
    ];
  };
}
