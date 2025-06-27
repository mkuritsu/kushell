{ inputs, ... }:
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
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.qtmultimedia
      inputs.quickshell.packages.${pkgs.system}.default
    ];

    xdg.configFile."quickshell/kushell".source = ../kushell;
  };
}
