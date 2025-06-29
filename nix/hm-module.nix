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
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."quickshell/kushell".source = ../.;

    home.packages = [
      (inputs.quickshell.packages.${pkgs.system}.default.override {
        withJemalloc = true;
        withQtSvg = true;
        withWayland = true;
        withX11 = true;
        withPipewire = true;
        withPam = true;
        withHyprland = true;
      })
    ];
  };
}
