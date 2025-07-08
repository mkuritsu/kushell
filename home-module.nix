inputs:
{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.programs.kushell;

  defaultPackage = inputs.quickshell.packages.${pkgs.system}.default;
in
{
  options.programs.kushell = {
    enable = lib.mkEnableOption "kushell";

    package = lib.mkPackageOption pkgs "quickshell" {
      default = [ defaultPackage ];
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."quickshell/kushell".source = ../.;

    home.packages = [
      cfg.package
    ];
  };
}
