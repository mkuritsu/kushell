{
  config,
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
    xdg.configFile."quickshell/kushell".source = ../kushell;
  };
}
