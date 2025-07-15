inputs:
{
  symlinkJoin,
  makeWrapper,
  pkgs,
}:
let
  quickshell = (
    inputs.quickshell.packages.${pkgs.system}.default.override {
      # Disable uneeded modules to have less things to compile
      withX11 = false;
      withPam = false;
      withI3 = false;
    }
  );
in
symlinkJoin {
  pname = "kushell";
  version = "0.1-${quickshell.version}";

  paths = [ quickshell ];

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    makeWrapper $out/bin/quickshell $out/bin/kushell --unset QT_STYLE_OVERRIDE --add-flags '-p ${./.}'
  '';
}
