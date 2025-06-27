{
  inputs,
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
    enable = lib.mkEnableOption "enable kushell";
  };

  home.packages = lib.optionals cfg.enable [
    inputs.quickshell.packages.${pkgs.system}
  ];

  xdg.configFile."quickshell/kushell" = lib.mkIf cfg.enable {
    source = ../src;
  };
}
